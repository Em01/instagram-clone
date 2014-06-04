class LikesController < ApplicationController

  def new

  end

  def create 
    @post = Post.find params[:post_id]
    @post.likes.create
    WebsocketRails[:likes].trigger 'new', { new_like_count: @post.likes.count}




    redirect_to '/posts'
  end
end
