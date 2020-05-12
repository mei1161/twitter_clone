# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @tweet = Tweet.new
  end

  def create
    @user = current_user.id
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user

    if @tweet.save
      pp current_user
      redirect_to user_path(current_user.screen_name)
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
