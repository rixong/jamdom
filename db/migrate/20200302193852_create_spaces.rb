class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :size
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
