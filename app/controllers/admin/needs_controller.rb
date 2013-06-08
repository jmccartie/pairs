class Admin::NeedsController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource
  
  def index
  end
  
  def import
    Need.import(params[:file])
    redirect_to admin_needs_url
  end
  
end