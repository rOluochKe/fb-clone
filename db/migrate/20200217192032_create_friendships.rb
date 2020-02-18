# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.boolean  :status, default: 'new'
      t.integer  :user_id
      t.integer  :friend_id

      t.timestamps
    end
  end
end
