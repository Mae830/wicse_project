class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def create
    @location = Location.find(params[:location_id])
    @favorite = Favorite.new(user_id: current_user.id, location_id: @location.id)

    if @favorite.save
      
    else
      redirect_to location_path(@location)
    end
  end
end
