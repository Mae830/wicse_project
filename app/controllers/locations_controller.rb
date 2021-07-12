class LocationsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :delete]
    def index
      @locations = Location.all
      @cat_true = false;
      @title = "Locations"

      if params.dig(:location, :categories) != nil && params[:location][:categories]
        query_string = ""
        @cat_checked = params[:location][:categories].reject(&:blank?)
        if params[:location][:categories]
          @cat_checked.each do |cat|
            query_string << "'#{cat}'=ANY(categories)" << " AND "
          end
        end
        query_string = query_string[0...-4]
        @locations = @locations.where(query_string)
        @cat_true = true
      end

      if params[:search_by_name] && params[:search_by_name] != ""
        @locations = @locations.where("name ILIKE ? or zip = ? ", "%#{params[:search_by_name]}%","#{params[:search_by_name]}")
        @cat_true = false
      end
    end
    def trending
      @locations = Location.order(favorites_count: :desc).limit(8)
      @cat_true = false
      @title = "Trending"
      
      if params.dig(:location, :categories) != nil && params[:location][:categories]
        query_string = ""
        @cat_checked = params[:location][:categories].reject(&:blank?)
        if params[:location][:categories]
          @cat_checked.each do |cat|
            query_string << "'#{cat}'=ANY(categories)" << " AND "
          end
        end
        query_string = query_string[0...-4]
        @locations = @locations.where(query_string)
        @cat_true = true
      end

      if params[:search_by_name] && params[:search_by_name] != ""
        @locations = @locations.where("name ILIKE ? or zip = ? ", "%#{params[:search_by_name]}%","#{params[:search_by_name]}")
        @cat_true = false
      end
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
      @location = current_user.locations.build(location_params)
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
    def edit
      @location = Location.find(params[:id])
    end 
    def update
      @location = Location.find(params[:id])

      if @location.update(location_params)
        redirect_to @location
      else
        render :edit
      end
    end
  
    private
    def location_params
        params.require(:location).permit(:name, :street1, :street2, :city, :state, :zip, categories: [])
    end
end