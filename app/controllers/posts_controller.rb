# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :DESC)
    @post = Post.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    flash[:success] = 'Post successfully created' if @post.save
    redirect_to request.referrer
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:success] = 'Post successfully edited'
      redirect_to posts_path
    else
      flash.now[:danger] = 'Edit failed'
      render 'new'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.comments.empty?
      @post.delete
      flash[:success] = 'Post deleted'
    end
    redirect_to request.referrer
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
