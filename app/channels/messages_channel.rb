class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stop_all_streams
    # conversation = Conversation.find(params[:id])
    # stream_for conversation
    stream_from "messages_channel"
    # stream for :messages
  end

  # def received(data)
  #     render json: data
  # end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # stop_all_streams
    raise NotImplementedError
  end
end
