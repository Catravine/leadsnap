class AddRoundToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :round, :integer, :default => 0
    add_column :campaigns, :round_start_date, :datetime
    add_column :leads, :round, :integer, :default => 0
  end
end
