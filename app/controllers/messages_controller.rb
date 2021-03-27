class MessagesController < ApplicationController

    def index 
        render json: Message.all
    end
    def create 
        message = Message.create(message_params)
        convo = Conversation.find(message_params[:conversation_id])

        serialized_data = ConversationSerializer.new(convo)

        MessagesChannel.broadcast_to convo, serialized_data
    end

    private

    def message_params
        params.permit(:client_id, :barber_id, :text, :conversation_id, :sent_by)
    end
end
