class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :fullname
      t.string :picture
      t.string :phone

      t.timestamps null: false
    end
  end
end
