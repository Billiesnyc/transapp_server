class BusinessesController < ApplicationController

    def index 
        render json:Business.all
      end 
      
      def show
        category = Business.find(params[:id])
        render json:category
      end
    
      def new
        @business = Business.new
      end
    
      def create
        created = Business.find_or_create_by(name: params[:name].capitalize)
        render json: created
      end


end
