class ClientReviewCommentsController < ApplicationController
    def index
      client_review_comments = ClientReviewComment.all
      render json: client_review_comments.to_json
    end
  
    def show
      client_review_comment = ClientReviewComment.find(params[:id])
      render json: client_review_comment
    end
  
    def update
      client_review_comment = ClientReviewComment.find(params[:id])
      client_review_comment.update(content: params["content"])
      render json: client_review_comment.to_json
    end
  
    def create
      client_review_comment = ClientReviewComment.create(content: params["content"], client_id: params['client_id'],client_review_id: params['client_review_id'])
      render json: client_review_comment.to_json 
    end
  
    def destroy
      client_review_comment = ClientReviewComment.find(params[:id])
      client_review_comment.destroy
    end
end
