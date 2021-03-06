class BusinessesController < ApplicationController

    def index 
        render json:Business.all
      end 
      
      def cities
        cities = []
        Business.all.each do |listing| cities.push(listing.city) end
        render json:cities.uniq.sort
      end

      def categories
        categories = []
        Business.all.each do |listing| categories.push(listing.category) end
        render json:categories.uniq.sort
      end

      def show
        business = Business.find(params[:id])
        reviews = []
        up_score = 0
        down_score = 0
          business.reviews.each do |review|
            if review.up == true 
              up_score = up_score + 1
            elsif review.up == false
              down_score = down_score + 1
            end
            reviews.push({
              "id": review.id,
              "business_id": review.business_id,
              "user_id": review.user_id,
              "review_text": review.review_text,
              "up": review.up,
              "date":review.date,
              "gender": review.user.gender
              })
          end

        render json:[reviews.reverse, "overall_up": up_score, "overall_down": down_score]
      end
    
      def new
        @business = Business.new
      end
    
      def create
        created = Business.find_or_create_by(
        name: params[:name],
        latitude: params[:latitude],
        longitude: params[:longitude],
        category: params[:category],
        city: params[:city],
        state: params[:state],
        country: params[:country],
        places_id: params[:places_id])

        review = Review.create(
        user_id: params[:user_id], 
        business_id: created.id, 
        up: params[:up], 
        review_text: params[:review])

        render json: created
      end


end
