# frozen_string_literal: true

module Common
  extend ActiveSupport::Concern

  def get_tweets
    @retweets = current_user.retweets
    @reply = TweetImage.new
    @reply.build_image
  end
end
