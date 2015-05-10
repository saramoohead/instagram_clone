class LikesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @like = Like.new
    redirect_to posts_path
  end
end
