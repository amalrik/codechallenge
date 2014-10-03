class RenameLinesForeingKeyOnMetroRoutes < ActiveRecord::Migration
  def change
    rename_column :metro_routes, :line_id, :line
  end
end
