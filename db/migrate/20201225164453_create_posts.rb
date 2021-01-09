class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.string :title, null: false
      t.references :user

      t.timestamps
    end
  end
end
