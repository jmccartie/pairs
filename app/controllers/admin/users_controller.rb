class Admin::UsersController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def update
  end

  def delete
  end
end
