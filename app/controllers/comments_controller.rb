class CommentsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:comment][:post_id])
    @comments = @post.comments
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_back(fallback_location: posts_path)
    else
      flash[:alert] = 'Check the comment form'
      redirect_to root_path
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :replay)
  end

  def set_post
    @comment = Comment.find(params[:id])
  end
end
