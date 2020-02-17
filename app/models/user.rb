# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes

  has_many :active_friendships, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :passive_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  has_many :friendships, lambda { |user|
    unscope(:where).where('user_id = :id OR friend_id = :id', id: user.id)
  }, class_name: :Friendship, dependent: :destroy

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
end
