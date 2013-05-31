class HomeController < ApplicationController
  def index
  end
  
  def geocode
    search = Geocoder.search("#{params[:lat].to_f}, #{params[:long].to_f}")
    @results = search.first.formatted_address
    
    respond_to do |format|
      format.js { render :layout => false }
    end
  end
end
