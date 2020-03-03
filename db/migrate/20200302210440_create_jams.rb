class CreateJams < ActiveRecord::Migration[6.0]
  def change
    create_table :jams do |t|
      t.string :name
      t.integer :space_id
      t.date :date
      t.time :time
      t.text :info
      t.text :tunes
      
      t.timestamps
    end
  end
end
