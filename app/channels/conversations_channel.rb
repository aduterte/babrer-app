class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "conversations_channel"
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
end
