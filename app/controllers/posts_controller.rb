class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :description, :picture))
    @post.save

    redirect_to posts_path
    end

#     def edit
#       @post = Post.find(params[:id])

#       if @post.update(params["post"].permit(:title, :description))
#         redirect_to '/posts'
#       else
#         render 'edit'
#   end
# end

end