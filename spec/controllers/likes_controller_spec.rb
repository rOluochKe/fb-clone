# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before :each do
    @user = User.create(name: 'example', email: 'example@example.com', password: 'foobar')
    @post = @user.posts.build(content: 'New post')
    @post.save
  end

  describe 'create likes' do
    it 'creates a valid like' do
      @like = @user.likes.build(post_id: @post.id)
      expect(@like.valid?).to eql(true)
    end

    it 'creates like without post_id' do
      @like = @user.likes.build
      expect(@like.valid?).to eql(false)
    end

    it 'creates like without user_id' do
      @like = @post.likes.build
      expect(@like.valid?).to eql(false)
    end
  end
end
