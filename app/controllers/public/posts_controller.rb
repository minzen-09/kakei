class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_params, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "登録しました"
      redirect_to @post
    else
      flash.now[:alert] = "失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "登録しました"
      redirect_to @post
    else
      flash.now[:alert] = "失敗しました"
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to posts_path
  end

  private

  def set_params
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to root_url unless @post
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end