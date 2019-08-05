class ChessChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chess_channel'
  end
  def unsubscribed; end
  def create(opts)
    ChessStatusBroadcastJob.perform_later(opts.fetch('content'))
  end
end
