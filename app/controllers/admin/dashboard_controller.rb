class Admin::DashboardController < ApplicationController
  before_filter :require_login
  authorize_resource :class => false
  
  def index
  end
  
end
