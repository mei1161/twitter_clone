# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @tweet = Tweet.new
    @tweet.build_image
  end

  def create
    @user = current_user
    @tweet = Tweet.new(tweet_params)
    @tweet.user = @user

    if @tweet.save
      redirect_to user_path(current_user.screen_name)
      pp @tweet
    else

      @tweets = @user.tweets

      render 'users/show'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, image_attributes: %i[id image])
  end
end
