class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params.merge(post_id: params[:post_id]))
    if @comment.save
      flash[:notice] = "登録しました"
      redirect_to @comment.post
    else
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      flash.now[:alert] = "失敗しました"
      render 'public/posts/show'
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "削除しました"
    redirect_to @comment.post
  end

  private

  def set_params
    @comment = current_user.comments.find_by_id(params[:id])
    redirect_to root_url unless @comment
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end