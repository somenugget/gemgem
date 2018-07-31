class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :thing, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body
      t.integer :weight
      t.boolean :deleted

      t.timestamps
    end
  end
end
