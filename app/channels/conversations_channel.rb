class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    
    user_type = nil
    params[:type] == "false" ? user_type = Client : user_type = Barber if params[:type]
    if !!user_type
      # byebug
      @@user = user_type.find(params[:id])
    end

    if !!user_type
      # byebug
      stream_for @@user
       
    end
  end

  def receive(data)
    conversation = Conversation.where(barber_id: data['barber_id'], client_id: data['client_id'])
    # byebug
    if !conversation[0]
        # byebug
        conversation = Conversation.create(barber_id: data['barber_id'], client_id: data['client_id'])
        ConversationRelayJob.perform_later(conversation)
    end
  end

  def unsubscribed
    # stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
end
