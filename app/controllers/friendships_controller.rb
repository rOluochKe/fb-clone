# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    @friendship_requests = current_user.received_requests
    @friends = current_user.friends
  end

  def create
    current_user.friendships.create(friend_id: params[:friend_id], status: false)
    redirect_to users_path
  end

  def update
    @friendship ||= current_user.received_requests.find_by(user_id: params[:id])
    @friendship.update_attribute(:status, true)
    Friendship.create!(friend_id: @friendship.user_id, user_id: @friendship.friend_id, status: true)
    redirect_to friendships_path
  end

  def destroy
    @friendship = current_user.received_requests.find_by(user_id: params[:id])
    redirect_back(fallback_location: root_path) if @friendship.delete
  end

  # def unfriend
  #   @friendship = current_user.accepted_friendships.find_by(user_id: params[:format])
  #   @friendship1 = Friendship.find_by(user_id: @friendship.friend_id, friend_id: @friendship.user_id)
  #   redirect_back(fallback_location: root_path) if @friendship.delete && @friendship1.delete
  # end
end
