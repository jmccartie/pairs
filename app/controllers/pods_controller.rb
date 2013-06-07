class PodsController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource
  
  def index
     @map = Pod.includes(:address).all.to_gmaps4rails
  end
  
  def show
    @map = @pod.to_gmaps4rails
  end
end