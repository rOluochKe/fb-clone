# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'juan', email: 'bolo@g.com', password: '123456', password_confirmation: '123456') }

  # Unit tests

  it 'has a name' do
    expect(user.name).not_to be_nil
  end

  it 'has an email' do
    expect(user.email).not_to be_nil
  end

  it 'has a password' do
    expect(user.password).not_to be_nil
  end

  it 'creates a new user' do
    expect { user }.to change { User.count }.by(1)
  end

  context 'When submitting invalid forms' do
    it "doesn't allow names longer than 20 characters" do
      user.name = 'a' * 21
      expect { user.save }.to change { user.errors.full_messages.count }
    end

    it "doesn't allow passwords shorter than 3 characters" do
      user.password = 1
      expect { user.save }.to change { user.errors.full_messages.count }
    end

    it "doesn't allow emails longer than 255 characters" do
      user.email = 'a' * 256
      expect { user.save }.to change { user.errors.full_messages.count }.by(2)
    end

    it 'does not allow incorrect emails' do
      user.email = 'aaa.com'
      expect(user.valid?). to eq(false)
    end
  end

  it 'is associated to posts (has many of them)' do
    us = User.reflect_on_association(:posts)
    expect(us.macro).to eq(:has_many)
  end

  # Integration tests
  describe User do
    it 'has a valid Factory' do
      build(:user).should be_valid
    end
  end

  describe 'has posts associated' do
    it 'can create a post' do
      @user = FactoryBot.create(:user)
      expect { @user.posts.create(content: 'bla' * 100, title: 'When') }.to change { Post.count }
    end
  end
end
