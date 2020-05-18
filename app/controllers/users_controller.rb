# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find_by!(screen_name: params[:id])
    @tweet = TweetImage.new
    @tweet.build_image
    @tweets = @user.tweets
    @retweets = current_user.retweets
  end

  def destroy
    @retweet = current_user.retweets.find(retweet_id: params[:id])
    @retweet.destroy
    redirect_to user_path(current_user.screen_name)
  end
end
