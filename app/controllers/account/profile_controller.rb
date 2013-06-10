class Account::ProfileController < ApplicationController

  def show
  end

  def edit
    @user = current_user
    @user.contact ||= @user.build_contact
    @user.contact.address ||= @user.contact.build_address
  end

  def update
    current_user.update_attributes(params[:user])
    if current_user.save
      redirect_to account_profile_path, :notice => "Profile updated."
    end
  end
end
