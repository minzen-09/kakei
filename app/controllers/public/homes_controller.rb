class Public::HomesController < ApplicationController
  before_action :reject_sign_in_users, only: [:top]

  def top
  end

  def about
  end

  private

  def reject_sign_in_users
    redirect_to mypage_path if user_signed_in?
  end
end
