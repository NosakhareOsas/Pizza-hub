class RestaurantsController < ApplicationController
    
    def index
        render json: Restaurant.all, only: [:id, :name, :address], status: :ok
    end

    def show
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            render json: restaurant, only: [:id, :name, :address],  methods: :all_pizzas, status: :ok
        else
            render json: { error: "Restaurant not found" }, status: :not_found
        end
    end

    def destroy
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            restaurant.destroy
            head :no_content
        else
            render json: { error: "Restaurant not found" }, status: :not_found
        end
    end
end
