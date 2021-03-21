class ClientReviewsController < ApplicationController
  def index
    client_reviews = ClientReview.all
    render json: client_reviews.to_json
  end

  def show
    client_review = ClientReview.find(params[:id])
    render json: client_review
  end

  def update
    client_review = ClientReview.find(params[:id])
    client_review.update(rating: params["rating"],content: params["content"])
    render json: client_review.to_json
  end

  def create
    client_review = ClientReview.create(rating: params["rating"],content: params["content"], barber_id: params["barber_id"], client_id: params['client_id'])
    render json: client_review.to_json 
  end

  def destroy
    client_review = ClientReview.find(params[:id])
    client_review.destroy
  end
end
