# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'content' do
    before :each do
      @user = User.create(name: 'examplet', email: 'examplet@examplet.com', password: 'foobar')
      @post = @user.posts.build(content: 'New post')
      @post.save
      @comment = @post.comments.create(content: 'I have commented', user_id: @user.id)
      expect(@comment.valid?).to eql(true)
    end

    it 'should not add an empty post' do
      @comment.content = ''
      expect(@comment.valid?).to eql(false)
      expect(@comment.errors.messages[:content]).to include("You can't create an empty post")
    end

    it 'should belong to user' do
      @comment.user_id = null
      expect(@comment.valid?).to eql(false)
      expect(@comment.errors.messages[:user]).to eql(false)
    end

    it 'should belong to a post' do
      @comment.post_id= nil
      expect(@comment.valid?).to eql(false)
    end
  end
end
