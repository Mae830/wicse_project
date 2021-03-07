class LocationsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :delete]
    def index
      @locations = Location.all
    end
    def show
      @location = Location.find(params[:id])
      if user_signed_in?
        @favorite = Favorite.where(user_id: current_user.id, location_id: @location.id).take
      end
    end
    def new
      @location = Location.new
    end
    def create
      @location = Location.new(location_params)
      @user = @location.build_user(id: current_user.id)
      if @location.save
        redirect_to @location
      else
        render :new
      end
    end
    def destroy
      @location = Location.find(params[:id])
      @location.destroy
      flash[:alert] = "This location has been deleted."
      redirect_to locations_path
    end
  
    private
    def location_params
        params.require(:location).permit(:name, :street1, :street2, :city, :state, :zip)
    end
end