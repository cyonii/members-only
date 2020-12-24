class AddTitleToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :title, :string, null: false
  end
end
