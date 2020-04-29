class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :layout_row
      t.integer :layout_column

      t.timestamps
    end
  end
end
