# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def index
    @requests = current_user.friend_requests
  end

  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      flash[:success] = 'Invitation sent'
    else
      flash[:danger] = 'Something went wrong :('
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
    @user = current_user
    @request = Friendship.find_by(friend_id: fpar[:friend_id])
  end

  def update
    fpar = params[:friendship]
    @user = current_user
    @request = Friendship.all.find(fpar[:req_id])

    @request.status = true

    if @request.save
      flash[:success] = 'Invitation accepted'
    else
      flash[:danger] = 'Something went wrong :('
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id, :user_id, :status)
  end
end
