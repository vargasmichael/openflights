module Api
    module V1
        class ReviewsController < ApplicationController
            protect_from_forgery with: :null_session

            def index
                reviews = Review.all

                render json: ReviewSerializer.new(reviews, options).serialized_json
            end

            def show
                review = Review.find_by(id: params[:slug])

                render json: ReviewSerializer.new(review, options).serialized_json
            end


            def create
                logger.debug params.inspect

                review = Review.new(review_params)

                if review.save
                    render json: ReviewSerializer.new(review).serialized_json
                else 
                    render json: { error: review.errors.messages }, status: 422
                end
            end

            def destroy
                review = Review.find(params[:slug])

                if review.destroy
                    head :no_content
                else 
                    render json: { error: review.errors.messages }, status: 422
                end
            end

            private

            def review_params
                params.require(:review).permit(:title, :description, :score, :airline_id)
            end
            def options
                @options ||= { include: %i[airlines]}
            end
        end
    end
end 