class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "You do not have access to that page. You can request access by emailing info@servemoore.com"
  end
  
end
