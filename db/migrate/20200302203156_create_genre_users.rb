class CreateGenreUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_users do |t|
      t.integer :genre_id
      t.integer :user_id

      t.timestamps
    end
  end
end
