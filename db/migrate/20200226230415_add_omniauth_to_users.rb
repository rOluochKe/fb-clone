<<<<<<< HEAD
# frozen_string_literal: true

=======
>>>>>>> 90f05d58a252165f4aaa28221ab7064c4e6e9c1d
class AddOmniauthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :image, :text
  end
end
