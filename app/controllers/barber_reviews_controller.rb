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
    barber = Barber.find(params["barber_id"])
    barber_review.update(rating: params["rating"],content: params["content"])
    # byebug
    render :json => barber.to_json(:include =>[:photos,:barber_reviews => {:include => :barber_review_comments}])
  
  end

  def create
    
    barber = Barber.find(params["barber_id"])
    barber_review = BarberReview.create(rating: params["rating"],content: params["content"], barber_id: params["barber_id"], client_id: params['client_id'])
    render :json => barber.to_json(:include =>[:photos,:barber_reviews => {:include => :barber_review_comments}])
  end

  def destroy
    barber_review = BarberReview.find(params[:id])
    barber_review.destroy
  end

end
