# frozen_string_literal: true

class RetweetsController < ApplicationController
  before_action :authenticate_user!
  def create
    if current_user.retweets.exists?(tweet_id: params[:id])
      redirect_to user_path(current_user.screen_name)
      return
    end
    @tweet_retweet = TweetRetweet.new
    @retweet = Retweet.new
    @retweet.tweet_id = params[:id]
    @retweet.tweet_retweet = @tweet_retweet
    @tweet_retweet.user = current_user
    @tweet_retweet.save
    @retweet.save
    redirect_to user_path(current_user.screen_name)
  end

  def destroy
    @retweet = current_user.retweets.find_by(tweet_id: params[:id])
    @retweet.destroy
    redirect_to user_path(current_user.screen_name)
 end
end
