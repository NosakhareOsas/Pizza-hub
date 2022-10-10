class RestaurantsController < ApplicationController
    def index
        render json: Restaurant.all, only: [:id, :name, :address], status: :ok
    end

    def show
        # restaurant = Restaurant.find_by(id: params[:id])
        # render json: restaurant.
    end

    def destroy
    end
end
