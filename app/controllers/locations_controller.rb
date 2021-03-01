class LocationsController < ApplicationController
    def index
      @locations = Location.all
    end
    def show
      @location = Location.find(params[:id])
      @favorite = Favorite.where(user_id: current_user.id, location_id: @location.id).take
    end
    def new
      @location = Location.new
    end
    def create
      @location = Location.new(location_params)
      if @location.save
        redirect_to @location
      else
        render :new
      end
    end
  
    private
    def location_params
        params.require(:location).permit(:name, :street1, :street2, :city, :state, :zip)
    end
end