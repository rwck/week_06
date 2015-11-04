class MakeCertainFieldsCompulsory < ActiveRecord::Migration
  def change
    change_column :projects, :name, :string, null: false
    change_column :issues, :item, :string, null: false
    change_column :users, :admin, :boolean, default: false, null: false
  end
end
