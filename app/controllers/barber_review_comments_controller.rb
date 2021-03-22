class BarberReviewCommentsController < ApplicationController
  
      def index
        barber_review_comments = BarberReviewComment.all
        render json: barber_review_comments.to_json       
      end
    
      def show
        barber_review_comment = BarberReviewComment.find(params[:id])
        render json: barber_review_comment
      end
    
      def update
        barber = Barber.find(params["barber_id"])
        barber_review_comment = BarberReviewComment.find(params[:id])
        barber_review_comment.update(content: params["content"])
        render :json => barber.to_json(:include =>[:photos,:barber_reviews => {:include => :barber_review_comments}])
      end
    
      def create
        barber = Barber.find(params["barber_id"])
        barber_review_comment = BarberReviewComment.create(content: params["content"], barber_id: params['barber_id'],barber_review_id: params['barber_review_id'])
        # byebug
        render json: barber
        # render :json => barber.to_json(:include =>[:photos,:barber_reviews => {:include => :barber_review_comments}])
      end
    
      def destroy
        barber = Barber.find(params["barber_id"])
        barber_review_comment = BarberReviewComment.find(params[:id])
        barber_review_comment.destroy
        render :json => barber.to_json(:include =>[:photos,:barber_reviews => {:include => :barber_review_comments}])
      end
  end
  