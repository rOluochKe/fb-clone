# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      destroy
    else
      if params.include? 'comment_id'
        @comment = Comment.find(params[:comment_id])
        @like = @comment.likes.create(user_id: current_user.id)
      elsif params.include? 'post_id'
        @post = Post.find(params[:post_id])
        @like = @post.likes.create(user_id: current_user.id)
      end
      redirect_to request.referrer
    end
  end

  private

  def already_liked?
    if params.include? 'post_id'
      Like.where(user_id: current_user.id, likable_id: params[:post_id]).exists?
    elsif params.include? 'comment_id'
      Like.where(user_id: current_user.id, likable_id: params[:comment_id]).exists?
    end
  end

  def destroy
    @like = find_like
    @like&.destroy
    redirect_to request.referrer
  end

  def find_like
    if params.include? 'post_id'
      @post = Post.find(params[:post_id])
      @like = @post.likes.find_by(user_id: current_user.id)
    elsif params.include? 'comment_id'
      @comment = Comment.find(params[:comment_id])
      @like = @comment.likes.find_by(user_id: current_user.id)
    end
  end
end
