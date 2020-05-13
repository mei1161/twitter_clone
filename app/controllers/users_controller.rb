# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by!(screen_name: params[:id])
    @tweets = @user.tweets
    @tweet = Tweet.new
    @tweet.build_image
  end
end