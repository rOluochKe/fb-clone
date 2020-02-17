# frozen_string_literal: true

class Friendship < ApplicationRecord
  validates :status, inclusion: { in: [true, false] }

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :already, ->(user, friend) { where('user_id = (?)', user).where('friend_id = (?)', friend) }
  scope :invitation_requests, ->(user, friend) { where('status = (?)', false).where('friend_id = (?)', user.id).where('user_id = (?)', friend.id) }
  scope :invitation_sent, ->(user, friend) { where('status = (?)', false).where('friend_id = (?)', friend.id).where('user_id = (?)', user.id) }
  scope :friends_active, ->(user) { where('status = (?) = ', true).where('user_id = (?)', user) }
  scope :friends_passive, ->(user) { where('status = (?) = ', true).where('friend_id = (?)', user) }
  scope :act_pas_friends?, ->(user, friend) { where('user_id = (?)', user).where('friend_id = (?)', friend).where('status=(?)', true) }
  scope :accepted_friendships, ->(user, friend) { where('user_id = :id and friend_id = :id2 OR user_id = :id2 and friend_id = :id', id: user.id, id2: friend.id).where('status = (?)', true) }
end
