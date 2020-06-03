# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  include Common
  def show
    @user = User.find_by!(screen_name: params[:id])
    @tweet = TweetImage.new
    @tweet.build_image
    @tweets = @user.tweets
    get_tweets
  end

  def likes
    @like_tweets = current_user.like_tweets
    get_tweets
  end
end
