# frozen_string_literal: true

class Friendship < ApplicationRecord
  validates :status, inclusion: { in: [true, false] }

  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates_uniqueness_of :user_id, scope: [:friend_id]
  scope :accepted, -> { where(status: true) }
  scope :unaccepted, -> { where(status: false) }

  def users_are_not_already_friends
    errors.add(:user_id, 'Already friends!') if Friendship.where(user_id: friend_id, friend_id: user_id).exists? && Friendship.where(user_id: user_id, friend_id: friend_id).exists?
  end
end
