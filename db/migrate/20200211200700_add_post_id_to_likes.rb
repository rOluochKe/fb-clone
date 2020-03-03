# frozen_string_literal: true

class AddPostIdToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :post, null: false, foreign_key: true
  end
end
