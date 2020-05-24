# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @tweet = TweetImage.new
    @tweet.build_image
  end

  def create
    @user = current_user

    @tweet = if params[:tweet_image][:image_attributes].present?
               TweetImage.new(tweet_image_params)
             else
               TweetText.new(tweet_text_params)
             end

    @tweet.user = @user
    if @tweet.save
      redirect_to user_path(current_user.screen_name)
    else
      @tweets = @user.tweets
      @tweet = @tweet.becomes(TweetImage)
      @tweet.build_image
      @retweets = current_user.retweets
      @likes = current_user.likes

      render 'users/show'
    end
  end

  def destroy
    @tweet = current_user.tweets.find_by(id: params[:tweet_id])
    @tweet.destroy
    redirect_to user_path(current_user.screen_name)
  end

  private

  def tweet_image_params
    params.require(:tweet_image).permit(:content, :reply_id, image_attributes: %i[image tweet_id])
  end

  def tweet_text_params
    params.require(:tweet_image).permit(:content, :reply_id)
  end
end
