class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  before_action :set_params, only: [:show, :edit, :update, :destroy, :favorites, :followings, :followers]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to mypage_path
    else
      flash.now[:alert] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  def mypage
    @date = Time.current
    @date = Time.zone.parse(params[:date]) if params[:date].present?
    range = @date.all_month
    @budgets = current_user.budgets.where(payment_date: range)
  end

  def favorites
    @posts = @user.favorite_posts
  end

  def followings
    @users = @user.following_users
  end

  def followers
    @users = @user.follower_users
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_params
    @user = User.find(params[:id])
  end
end
