class CreateJams < ActiveRecord::Migration[6.0]
  def change
    create_table :jams do |t|
      t.string :name
      t.integer :space_id
      
      t.timestamps
    end
  end
end
