# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before :each do
    @user = User.create(name: 'example', email: 'example@example.com', password: 'foobar')
    @post = @user.posts.build(content: 'New post')
    @post.save
  end

  describe 'Create a comment' do
    it 'creates a valid comment' do
      @comment = @post.comments.create(content: 'I have commented', user_id: @user.id)
      expect(@comment).to be_valid
    end

    it 'creates a blank comment' do
      @comment = @post.comments.create(content: ' ', user_id: @user.id)
      expect(@comment.valid?).to eql(false)
    end
  end
end
