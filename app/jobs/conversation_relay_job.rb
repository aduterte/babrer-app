class ConversationRelayJob < ApplicationJob
    queue_as :default

    def perform(conversation)
        
        barber = conversation.barber
        client = conversation.client
        # byebug
        ConversationsChannel.broadcast_to(barber, ConversationSerializer.new(conversation))
        ConversationsChannel.broadcast_to(client, ConversationSerializer.new(conversation))

    end
end
