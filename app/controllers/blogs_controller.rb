class BlogsController < ApplicationController
  def index
  end
  def show
  end
  def codesnippets
    redirect_to root_path
 
  end

  def new 
    @post = Blog.new
  end

  def create
    @post = Blog.new(params[:title, :post])
    if @post.save?
        redirect_to blog_index_path
      end
  end



end
