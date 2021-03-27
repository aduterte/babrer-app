class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    # byebug
    @conversation = Conversation.find(params[:id])
    stream_for @conversation
    # byebug
    # stream_from "messages_channel"
    # stream for :messages
  end

  def receive(data)
      # render json: data
      convo = Conversation.find(data['conversation_id'])
      # byebug
      message = convo.messages.create(text: data['text'], barber_id: data['barber_id'], client_id: data['client_id'], sent_by: data['sent_by'])
      # byebug
      MessageRelayJob.perform_later(message)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
    # raise NotImplementedError
  end
end
