# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @tweet = TweetImage.new
    @tweet.build_image
  end

  def create
    @user = current_user

    if params[:tweet_image][:image_attributes].present?
      @tweet = TweetImage.new(tweet_image_params)
      pp tweet_image_params
    else
      @tweet = TweetText.new(tweet_text_params)
    end

    @tweet.user = @user
    if @tweet.save
      redirect_to user_path(current_user.screen_name)
    else
      @tweets = @user.tweets
      @tweet = TweetImage.new
      render 'users/show'
    end
  end

  private

  def tweet_image_params
    params.require(:tweet_image).permit(:content, image_attributes: %i[image tweet_id])
  end

  def tweet_text_params
    params.require(:tweet_image).permit(:content)
  end
end
