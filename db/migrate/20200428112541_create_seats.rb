class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :seat_id
      t.string :row
      t.integer :column
      t.string :status, default: "AVAILABLE"
      t.integer :closest, default: 4
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
