# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!
  include Common
  def index
    @users = User.all
    @follow_users = current_user.follows.pluck(:follow_id)
    @follow_users += [current_user.id]
    @tweets = Tweet.where(user_id: @follow_users).order(:created_at)
    @tweet = TweetImage.new
    @tweet.build_image
    get_tweets
  end

  def show; end
end
