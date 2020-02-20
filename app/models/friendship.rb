# frozen_string_literal: true

class Friendship < ApplicationRecord
  validates :status, inclusion: { in: [true, false] }

  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates_uniqueness_of :user_id, scope: [:friend_id]
  scope :accepted, -> { where(status: true) }
  scope :unaccepted, -> { where(status: false) }
end
