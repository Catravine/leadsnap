class ChangeRoundStartInCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :days_old_nos, :integer, default: 90
  end
end
