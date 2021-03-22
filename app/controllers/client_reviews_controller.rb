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
    client = Client.find(params["client_id"])
    client_review.update(rating: params["rating"],content: params["content"])
    # byebug
    render :json => client.to_json(:include =>[:client_reviews => {:include => :client_review_comments}])
  end

  def create
    client = Client.find(params["client_id"])
    client_review = ClientReview.create(rating: params["rating"],content: params["content"], barber_id: params["barber_id"], client_id: params['client_id'])
    render :json => client.to_json(:include =>[:client_reviews => {:include => :client_review_comments}])
  end

  def destroy
    client_review = ClientReview.find(params[:id])
    client_review.destroy
  end
end
