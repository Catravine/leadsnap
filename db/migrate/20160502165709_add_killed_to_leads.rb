class AddKilledToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :killed, :boolean, :default => false
  end
end
