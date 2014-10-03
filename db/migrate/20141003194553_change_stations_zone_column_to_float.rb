class ChangeStationsZoneColumnToFloat < ActiveRecord::Migration
  def change
    change_column :stations, :zone, :float
  end
end
