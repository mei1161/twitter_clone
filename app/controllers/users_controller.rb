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
end
