class AddLastDialedAndCountToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :last_dialed, :timestamp, :null => false, :default => Time.now
    add_column :leads, :dial_count, :integer, default: 0
  end
end
