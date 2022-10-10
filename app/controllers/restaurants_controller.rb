class RestaurantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        render json: Restaurant.all, only: [:id, :name, :address], status: :ok
    end

    def show
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            render json: restaurant, only: [:id, :name, :address],  methods: :all_pizzas, status: :ok
        else
            render_error
        end
    end

    def destroy
        restaurant = Restaurant.find_by(id: params[:id])
        restaurant.destroy
        head :no_content
    end

    private
    def render_not_found_response
        render json: { error: "Restaurant not found" }, status: :not_found
    end
end
