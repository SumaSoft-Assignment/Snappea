module Api
  module V1
    class RestaurantsController < ApplicationController
      before_action :validate_api  #validate each api

      # Get list of all restaurants
      def index
        restaurants = Restaurant.all.page(params[:page].to_i)
        render json: { success: true, error: '', data: restaurants }, status: 200
      end

      # Get all menus of a restaurant
      def menu_list
        restaurant = Restaurant.find_by(id: params[:id])
        render json: { success: false, error: 'Invalid id', data: [] }, status: 404 and return unless restaurant
        menus = restaurant.menus.page(params[:page].to_i)
        render json: { success: true, error: '', data: format_menu_json(menus) }, status: 200
      end

      private

      def format_menu_json(menu)
        menu_response = []
        menu.each do |item|
          menu_response << { id: item.id,
                             name: item.name,
                             description: item.description,
                             category: item.category.name }
        end
        menu_response
      end
    end
  end
end

