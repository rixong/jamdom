class CreateJams < ActiveRecord::Migration[6.0]
  def change
    create_table :jams do |t|
      t.string :name
      t.string :genre
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
