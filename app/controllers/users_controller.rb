# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[create index]

  def index
    @users = User.all - [current_user]
    @friends = current_user.friendships
    @requests = current_user.friendships
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(created_at: :DESC)
    @post = Post.new
    @comment = Comment.new
  end
end
