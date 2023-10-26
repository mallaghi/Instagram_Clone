class ExpireStoriesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Story.where('expires_at <= ?', Time.now).destroy_all
  end
end
