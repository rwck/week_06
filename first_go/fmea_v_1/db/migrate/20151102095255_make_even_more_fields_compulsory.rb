class MakeEvenMoreFieldsCompulsory < ActiveRecord::Migration
  def change
    change_column :issues, :project_id, :integer, null: false
  end
end
