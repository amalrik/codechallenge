class RenameStationForeingKeysOnLines < ActiveRecord::Migration
  def change
    rename_column :lines, :station_a_id, :station1
    rename_column :lines, :station_b_id, :station2
  end
end
