class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :game_title
      t.integer :evaluation
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
