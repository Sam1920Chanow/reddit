class UpdateComments < ActiveRecord::Migration
  def change
    add_reference :comments, :parent, index: true
    add_column :comments, :body, :string
    add_reference :comments, :post, index: true
  end
end
