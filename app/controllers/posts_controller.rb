class PostsController < ApplicationController
  def index
    @posts = Post.where(draft: false).order(publishedOn: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
