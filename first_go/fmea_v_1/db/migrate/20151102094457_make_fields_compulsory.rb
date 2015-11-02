class MakeFieldsCompulsory < ActiveRecord::Migration
  def change
    change_column :projects, :user_id, :integer, null: false
  end
end

#
# t.integer  "user_id"
# t.datetime "created_at", null: false
