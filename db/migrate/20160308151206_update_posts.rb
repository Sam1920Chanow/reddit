class UpdatePosts < ActiveRecord::Migration
  def change
     add_reference :posts, :channel, index: true

     add_column :posts, :title, :string

     add_column :posts, :text, :text
  end
end
