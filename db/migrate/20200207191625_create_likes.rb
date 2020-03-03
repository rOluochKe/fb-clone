# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :likable, polymorphic: true

      t.timestamps
    end
  end
end
