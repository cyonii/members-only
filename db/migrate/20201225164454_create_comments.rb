class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text, null: false, default: ""
      t.references :post
      t.references :member

      t.timestamps
    end
  end
end
