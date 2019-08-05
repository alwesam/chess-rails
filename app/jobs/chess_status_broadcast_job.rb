class ChessStatusBroadcastJob < ApplicationJob
  queue_as :default
  def perform(content)
    ActionCable
      .server
      .broadcast('chess_channel', content: content)
  end
end
