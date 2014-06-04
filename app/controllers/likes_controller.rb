class LikesController < ApplicationController

  def new

  end

  def create 
    @post = Post.find params[:post_id]
    @post.likes.create
    redirect_to '/posts'
  end
end
