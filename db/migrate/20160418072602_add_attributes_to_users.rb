class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :phone, :string
    add_column :users, :approved, :boolean, :default => false, :null => false
    add_index :users, :approved
  end
end
