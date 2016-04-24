class SetDefaultForCampaigns < ActiveRecord::Migration
  def change
    change_column_default :campaigns, :available, true
    change_column_default :campaigns, :year, DateTime.now.year
  end
end
