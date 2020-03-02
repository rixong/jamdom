class CreateGenreJams < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_jams do |t|
      t.integer :genre_id
      t.integer :jam_id

      t.timestamps
    end
  end
end
