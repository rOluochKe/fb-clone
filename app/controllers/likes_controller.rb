class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:id])
    if @post.present?
      @like = Like.new(user_id: current_user.id, post_id: @post.id)
      if @like.save
        redirect_to post_redirect(@post), :notice => 'Liked!'
      else
        redirect_to post_redirect(@post), :alert => 'An error prevented you from liking this post!'
      end
    else
      redirect_to post_redirect(@post), :alert => 'Invalid post!'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.present?
      @like = Like.where(user_id: current_user.id, post_id: @post.id).first
      if @like.destroy
        redirect_to post_redirect(@post), :notice => 'Unliked!'
      else
        redirect_to post_redirect(@post), :alert => 'An error prevented you from unliking this post!'
      end
    else
      redirect_to p, :alert => 'Invalid post!'
    end
  end
  
end
