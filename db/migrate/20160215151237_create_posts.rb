class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :professor, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :upvote
      t.string :text

      t.timestamps null: false
    end
  end
end
