class Admin::RolesController < ApplicationController
  before_filter :require_login
  authorize_resource :class => false
  
  def index
    @roles = Role.order(:id).all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
    if @role.save
      redirect_to admin_roles_path
    end
  end
  
  def update
    @role = Role.find(params[:id])
    @role.update_attributes(params[:role])
    if @role.save
      redirect_to admin_roles_path
    end
  end

  def show
  end

  def edit
    @role = Role.find(params[:id])
  end
end
