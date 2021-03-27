class MessageRelayJob < ApplicationJob
    queue_as :default

    def perform(message)
        
        convo = message.conversation
        
        MessagesChannel.broadcast_to(convo, MessageSerializer.new(message))
    end
end
