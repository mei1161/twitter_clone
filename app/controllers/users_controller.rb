# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by!(screen_name: params[:id])
    @tweet = TweetImage.new
    @tweet.build_image
    @tweets = @user.tweets
  end
end