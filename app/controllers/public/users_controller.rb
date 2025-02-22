class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def mypage
    @date = Time.current
    @date = Time.zone.parse(params[:date]) if params[:date].present?
    range = @date.all_month
    @budgets = current_user.budgets.where(payment_date: range)
  end
end
