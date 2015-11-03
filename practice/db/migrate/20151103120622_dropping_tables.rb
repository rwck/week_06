class DroppingTables < ActiveRecord::Migration
  def change
    drop_table :issues
    drop_table :projects
  end
end
