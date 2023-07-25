class AddSubtitleToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :subtitle, :string
  end
end
