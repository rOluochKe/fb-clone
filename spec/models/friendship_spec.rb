# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:accepted) { build :friendship, :accepted }
  let(:pending) { build :friendship, :pending }
  let(:nil) { build :friendship, :nil }

  let(:user) { User.create(name: 'juan', email: 'bolo@g.com', password: '123456', password_confirmation: '123456') }
  let(:user2) { User.create(name: 'juan2', email: 'bolo2@g.com', password: '123456', password_confirmation: '123456') }

  describe 'when saving a friendship' do
    it 'it has a status' do
      accepted = Friendship.new(status: true, user_id: user.id, friend_id: user2.id)
      expect(accepted.save).to be(true)
    end

    it 'fails if it does not have a status' do
      accepted = Friendship.new(user_id: user.id, friend_id: user2.id)
      expect(accepted.save).to be(false)
    end

    it 'it has a friend_id to which the friendship was requested' do
      accepted = Friendship.new(status: false, user_id: user.id)
      expect(accepted.save).to be(false)
    end

    it 'it has a user_id to from which the friendship was requested' do
      accepted = Friendship.new(status: false, friend_id: user.id)
      expect(accepted.save).to be(false)
    end

    it 'is associated to users (belongs to one)' do
      us = Friendship.reflect_on_association(:user)
      expect(us.macro).to eq(:belongs_to)
    end

    it 'is associated to users (belongs to one)' do
      us = Friendship.reflect_on_association(:friend)
      expect(us.macro).to eq(:belongs_to)
    end
  end
end
