class ConversationsController < ApplicationController
    def index
        conversations = Conversation.all
        render json: conversations
      end
    
      def create
        # byebug
        conversation = Conversation.where(barber_id: params[:barber_id], client_id: params[:client_id])
        # byebug
        if !conversation[0]
          
            conversation = Conversation.create(conversation_params)
            byebug
        end
        serialized_data = ConversationSerializer.new(conversation)
            ActionCable.server.broadcast 'conversations_channel', serialized_data
            
        # conversation = Conversation.new(conversation_params)
        # if conversation.save
        #   serialized_data = ActiveModelSerializers::Adapter::Json.new(
        #     ConversationSerializer.new(conversation)
        #   ).serializable_hash
        #   ActionCable.server.broadcast 'conversations_channel', serialized_data
        #   head :ok
        # end
      end
      
      private
      
      def conversation_params
        params.permit(:title, :barber_id, :user_id, :client_id, :c_last_read, :b_last_read)
      end
    
end
