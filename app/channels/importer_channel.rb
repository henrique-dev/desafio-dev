class ImporterChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'importer_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
