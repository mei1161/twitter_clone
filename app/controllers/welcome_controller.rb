# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @follow_users = current_user.follows.pluck(:follow_id)
    @follow_users += [current_user.id]
    @tweets = Tweet.where(user_id: @follow_users).order(:created_at)
    @retweets = current_user.retweets
  end

  def show; end
end
