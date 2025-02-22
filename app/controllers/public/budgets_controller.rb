class Public::BudgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = current_user.budgets.build(budget_params)
    if @budget.save
      flash[:notice] = "登録しました"
      redirect_to @budget
    else
      flash.now[:alert] = "失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @budget.update(budget_params)
      flash[:notice] = "登録しました"
      redirect_to @budget
    else
      flash.now[:alert] = "失敗しました"
      render :new
    end
  end

  def destroy
    @budget.destroy
    flash[:notice] = "削除しました"
    redirect_to mypage_path
  end

  private

  def set_params
    @budget = current_user.budgets.find_by_id(params[:id])
    redirect_to root_url unless @budget
  end

  def budget_params
    params.require(:budget).permit(:title, :body, :category, :amount, :payment_date)
  end
end
