# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'example', email: 'example@example.com', password: 'foobar')
    @post = @user.posts.build(content: 'New post')
    @post.save
  end

  it 'should return false if post_id is missing' do
    @like = @user.likes.build
    @like.valid?
    expect(@like.errors[:post]).to include('must exist')
  end

  it 'should return true if post_id is present' do
    @like = @user.likes.build(post_id: @post.id)
    expect(@like.valid?).to eql(true)
  end

  it 'should return false if user_id is missing' do
    @like = @post.likes.build
    @like.valid?
    expect(@like.errors[:user]).to include('must exist')
  end

  it 'should return true if user_id is present' do
    @like = @post.likes.build(user_id: @user.id)
    expect(@like.valid?).to eql(true)
  end

  it 'should ensure a user does not like a post more than once' do
    @like = @post.likes.create(user_id: @user.id)
    @like2 = @post.likes.create(user_id: @user.id)
    expect(@like2.valid?).to eql(false)
    expect(@like2.errors[:user_id]).to include('has already been liked')
  end
end
