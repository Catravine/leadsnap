class AddDayLeadToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :day_lead, :boolean, :default => false
  end
end
