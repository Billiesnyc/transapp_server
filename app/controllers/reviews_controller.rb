class ReviewsController < ApplicationController

    def index 
        render json:Review.all
      end 
      
      def show
        review = Review.find(params[:id])
        render json:review
      end
    
      def new
        @review = Review.new
      end
    
      def create
        created = Review.find_or_create_by(user_id: params[:user_id], business_id: params[:business_id], up: params[:up], review_text: params[:review_text]))
        render json: created
      end

end
