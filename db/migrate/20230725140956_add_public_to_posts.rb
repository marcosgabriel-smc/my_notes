class AddPublicToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :public, :boolean
  end
end
