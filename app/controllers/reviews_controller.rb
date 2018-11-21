class ReviewsController < ApplicationController

    def index 
        render json:Review.all
      end 
      
      def show
        review = Review.find(params[:id])
        render json:category
      end
    
      def new
        @review = Review.new
      end
    
      def create
        created = Review.find_or_create_by(name: params[:name].capitalize)
        render json: created
      end

end
