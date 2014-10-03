class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :station_a_id
      t.integer :station_b_id
      t.integer :line

      t.timestamps
    end
    add_index :lines, :station_a_id
    add_index :lines, :station_b_id
  end
end
