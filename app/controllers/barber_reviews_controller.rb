class BarberReviewsController < ApplicationController
  def index
    barber_reviews = BarberReview.all
    render json: barber_reviews.to_json
  end

  def show
    barber_review = BarberReview.find(params[:id])
    render json: barber_review
  end

  def update
    barber_review = BarberReview.find(params[:id])
    barber_review.update(rating: params["rating"],content: params["content"])
    render json: barber_review.to_json
  end

  def create
    barber_review = BarberReview.create(rating: params["rating"],content: params["content"], barber_id: params["barber_id"], client_id: params['client_id'])
    render json: barber_review.to_json
  end

  def destroy
    barber_review = BarberReview.find(params[:id])
    barber_review.destroy
  end

end
