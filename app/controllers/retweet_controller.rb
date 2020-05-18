# frozen_string_literal: true

class RetweetController < ApplicationController
  before_action :authenticate_user!
  def show
    if current_user.retweets.exists?(retweet_id: params[:id])
      redirect_to user_path(current_user.screen_name)
      return
    end
    @tweet_retweet = TweetRetweet.new
    @retweet = Retweet.new
    @retweet.retweet_id = params[:id]
    @retweet.tweet = @tweet_retweet
    @tweet_retweet.user_id = current_user.id
    @tweet_retweet.save!
    @retweet.save!
    redirect_to user_path(current_user.screen_name)
  end
end
