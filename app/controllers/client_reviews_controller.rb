class ClientReviewsController < ApplicationController

  def show
    client_review = ClientReview.find(params[:id])
    render json: client_review
  end

  def update
    client_review = ClientReview.find(params[:id])
    client_review.update(rating: params["rating"],content: params["content"])
    # byebug
    render :json client_review
  end

  def create
    client = Client.find(params["client_id"])
    client_review = ClientReview.create(rating: params["rating"],content: params["content"], barber_id: params["barber_id"], client_id: params['client_id'])
    render :json => client.to_json(:include =>[:client_reviews => {:include => :client_review_comment}])
  end

  def destroy
    client_review = ClientReview.find(params[:id])
    client_review.destroy
    render :json client_review
  end
end
