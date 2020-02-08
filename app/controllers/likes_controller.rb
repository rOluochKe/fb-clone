class LikesController < ApplicationController
  before_action :get_post
  before_action :likes, only: [:destroy]

  def create
    if liked?
      flash[:notice] = "You can only like a post once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to posts_path
  end

  def destroy
    if !liked?
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end
    redirect_to posts_path
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def likes
    @like = @post.likes.find(params[:id])
  end

  def liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end
  
end
