class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def create
    @location = Location.find(params[:location_id])
    @favorite = Favorite.new(user_id: current_user.id, location_id: @location.id)

    if @favorite.save
      #flash message
      
    else
     
    end
    redirect_to location_path(@location)
  end
  def destroy
    favorite = Favorite.find(params[:favorite_id])
    location = favorite.location
    favorite.destroy
    redirect_to location_path(location)
  end
end
