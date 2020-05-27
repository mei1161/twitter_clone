# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    if current_user.likes.exists?(tweet_id: params[:id])
      redirect_to user_path(current_user.screen_name)
      return
    end
    @tweet = Tweet.find(params[:id])
    @like = current_user.likes.build(tweet: @tweet)
    @like.save
    redirect_to user_path(current_user.screen_name)
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: params[:id])
    @like.destroy
    redirect_to user_path(current_user.screen_name)
  end
end
