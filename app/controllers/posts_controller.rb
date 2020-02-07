# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create index]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    puts "#{$PROCESS_ID}$$$$$$$$$$$$ #{current_user}"
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def update
    if @post.update(content: params[:post][:content])
      redirect_to @post
    else
      flash[:warning] = 'something went wrong, make sure you have more than 20 characters in the content of the post, and a title'
      redirect_to root_path
    end
  end

  def edit; end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
