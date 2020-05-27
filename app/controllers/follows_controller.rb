# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました。'
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    end
    redirect_to user_path(@user.screen_name)
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました。'
    else
      flase.now[:alert] = 'ユーザーのフォロー解除に失敗しました。'
    end
    redirect_to user_path(@user.screen_name)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
