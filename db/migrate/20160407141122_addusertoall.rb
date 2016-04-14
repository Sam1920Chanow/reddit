class Addusertoall < ActiveRecord::Migration
  def change

    add_reference :posts, :user, index: true
    add_foreign_key :posts, :users

    add_reference :comments, :user, index: true
    add_foreign_key :comments, :users

  end
end
