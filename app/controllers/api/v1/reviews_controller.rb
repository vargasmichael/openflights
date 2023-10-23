module api
    module V1
        class ReviewsController < ApplicationController

            def create
                review = Review.new(review_params)

                if review.save
                    render json: ReviewsSerializer.new(review).serilalized_json
                else 
                    render json: { error: review.errors.messages }, status 422
                end
            end

            def destory
                review = Review.find(params[:id])

                if review.destroy
                    head :no_content
                else 
                    render json: { error: review.errors.messages }, status 422
                end
            end

            private

            def review_params
                params.require(:review).permit(:title, :description, :score, :airline_id)
            end
        end
    end
end