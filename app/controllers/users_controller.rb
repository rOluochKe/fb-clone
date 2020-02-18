# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[create index]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all - [current_user]
    @pending_friends = current_user.unconfirmed_friend_requests
    @friends = current_user.friends
    @requests = current_user.friend_requests
  end
end
