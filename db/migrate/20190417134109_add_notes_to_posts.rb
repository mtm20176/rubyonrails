class AddNotesToPosts < ActiveRecord::Migration[5.2]
  def change


    add_column :posts, :notes, :text
    add_index :posts, :notes

  end
end
