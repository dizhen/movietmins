class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :length
      t.string :director
      t.string :cast
      t.string :genre

      t.timestamps
    end
  end
end
