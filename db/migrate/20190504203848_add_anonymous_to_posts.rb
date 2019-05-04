class AddAnonymousToPosts < ActiveRecord::Migration[5.2]
  def change

	add_column :posts, :anonymous, :boolean, :default => false, :null => false

  end
end
