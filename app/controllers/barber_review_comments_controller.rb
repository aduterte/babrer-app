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
        barber_review_comment = BarberReviewComment.find(params[:id])
        barber_review_comment.update(content: params["content"])
        render json: barber_review_comment.to_json
      end
    
      def create
        barber_review_comment = BarberReviewComment.create(content: params["content"], client_id: params['barber_id'],client_review_id: params['barber_review_id'])
        render json: barber_review_comment.to_json 
      end
    
      def destroy
        barber_review_comment = BarberReviewComment.find(params[:id])
        barber_review_comment.destroy
      end
  end
  