class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.text :content
      t.boolean :isNotice

      t.timestamps
    end
  end
end
