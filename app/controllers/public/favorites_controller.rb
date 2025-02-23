class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    redirect_back(fallback_location: root_url)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    redirect_back(fallback_location: root_url)
  end
end
