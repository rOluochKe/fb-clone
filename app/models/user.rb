# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :accepted_friendships, -> { accepted }, class_name: 'Friendship'
  has_many :unaccepted_friendships, -> { unaccepted }, class_name: 'Friendship'
  has_many :friends, through: :accepted_friendships
  has_many :received_requests, -> { unaccepted }, foreign_key: :friend_id, class_name: 'Friendship'
  has_many :received_requests_users, through: :received_requests, source: :user
  has_many :sent_requests, through: :unaccepted_friendships, source: :friend

  def friend?(user)
    friends.include?(user)
  end

  def request_sent?(user)
    (received_requests_users + sent_requests).include?(user)
  end
end
