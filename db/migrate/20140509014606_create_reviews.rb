class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :movie_id

      t.timestamps
    end
    add_index :reviews, [:movie_id, :created_at]
  end
end
