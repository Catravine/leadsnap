class AddDisconnectedToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :disconnected, :boolean, :default => false
  end
end
