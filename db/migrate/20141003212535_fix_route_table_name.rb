class FixRouteTableName < ActiveRecord::Migration
  def change
    rename_table :routes, :metro_routes
  end
end
