class RemoveIssuesFromDatabase < ActiveRecord::Migration
  def change
    drop_table :issues
  end
end
