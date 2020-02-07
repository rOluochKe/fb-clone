# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[index new]
  def index
    @posts = Post.all
    @post = Post.new
  end

  def new; end

  def edit; end
end
