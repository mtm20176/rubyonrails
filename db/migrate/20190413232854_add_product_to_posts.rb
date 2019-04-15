class AddProductToPosts < ActiveRecord::Migration[5.2]
  def change

    add_column :posts, :product, :string
    add_index :posts, :product

  end
end
