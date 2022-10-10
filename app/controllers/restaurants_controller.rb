class RestaurantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        render json: Restaurant.all, only: [:id, :name, :address], status: :ok
    end

    def show
        find_restaurant
        render json: restaurant, only: [:id, :name, :address],  methods: :all_pizzas, status: :ok
    end

    def destroy
        find_restaurant
        restaurant.destroy
        head :no_content
    end

    private
    def find_restaurant
        restaurant = Restaurant.find_by(id: params[:id])
    end
    def render_not_found_response
        render json: { error: "Restaurant not found" }, status: :not_found
    end
end
