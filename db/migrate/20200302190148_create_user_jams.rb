class CreateUserJams < ActiveRecord::Migration[6.0]
  def change
    create_table :user_jams do |t|
      t.string :status
      t.integer :user_id
      t.integer :jam_id

      t.timestamps
    end
  end
end
