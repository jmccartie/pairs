class OauthsController < ApplicationController
  skip_before_filter :require_login

  def oauth
    login_at(params[:provider])
  end

  def logout
    if logged_in?
      reset_session
      forget_me!
      @current_user = nil
    end
    redirect_to root_path, :notice => "Logged Out"
  end

  def callback
    provider = params[:provider]
    if @user = login_from_twitter
      # Login User
      remember_me!
      if current_user.profile_complete?
        redirect_back_or_to root_path, :notice => "Logged in from #{provider.titleize}!"
      else
        redirect_to edit_my_account_profile_path, :notice => "Logged in from #{provider.titleize}!"
      end
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session
        auto_login(@user)
        redirect_to edit_my_account_profile_path, :notice => "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
      end
    end
  end
  
  # Sorcery Hack
  private
  def login_from_twitter
    provider = Config.send("twitter")
    provider.process_callback(params,session)
    user_hash = provider.get_user_hash
    config = user_class.sorcery_config
    attrs = user_attrs(provider.user_info_mapping, user_hash)
    
    if user = user_class.load_from_provider("twitter",user_hash[:uid].to_s)
      user.update_attributes(attrs)
      user.save
      return_to_url = session[:return_to_url]
      reset_session
      session[:return_to_url] = return_to_url
      auto_login(user)
      after_login!(user)
      user
    end
  end
end
