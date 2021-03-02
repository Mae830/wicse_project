class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def create
    @location = Location.find(params[:location_id])
    @favorite = Favorite.new(user_id: current_user.id, location_id: @location.id)

    if @favorite.save
      flash[:alert] = "#{@location.name} has been saved to favorites."
    else
      flash[:alert] = "There was an error adding #{@location.name} to favorites."
    end
    redirect_to location_path(@location)
  end
  def destroy
    favorite = Favorite.find(params[:favorite_id])
    location = favorite.location
    favorite.destroy
    flash[:alert] = "This location has been removed from favorites."
    redirect_to location_path(location)
  end
end
