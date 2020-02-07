# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  let(:post) { post = FactoryBot.create(:post) }

  # Unit tests

  it 'has content' do
    expect(post.content).not_to be_nil
  end

  it 'has a user associated' do
    expect(post.user_id).not_to be_nil
  end

  it 'creates a new post' do
    expect { post }.to change { Post.count }.by(1)
  end

  context 'When submitting invalid forms' do
    it "doesn't allow content post with less than 20 characters" do
      post.content = 'a' * 19
      expect { post.save }.to change { post.errors.full_messages.count }
    end
  end

  it 'is associated to users (belongs to one)' do
    us = Post.reflect_on_association(:user)
    expect(us.macro).to eq(:belongs_to)
  end

  # Integration tests
  describe Post do
    it 'has a valid Factory' do
      build(:post).should be_valid
    end
  end

  describe 'has users associated' do
    it 'can access its associated user' do
      @post = FactoryBot.build(:post)
      expect(@post.user).not_to be_nil
    end
  end
end
