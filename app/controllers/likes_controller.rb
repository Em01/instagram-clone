class LikesController < ApplicationController

  def new
    WebsocketRails[:likes].trigger 'hi', {}

    redirect_to '/posts'
  end

  def create 
    @post = Post.find params[:post_id]
    @post.likes.create
    WebsocketRails[:likes].trigger 'new', { id: @post.id, new_like_count: @post.likes.count}




    redirect_to '/posts'
  end
end
