# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.valid?
      @comment.save
    else
      flash[:alert] = 'You can not create an empty comment!'
    end
    redirect_to request.referrer
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(comment_params)
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.delete
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
