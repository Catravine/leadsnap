class AddCampaignToLeads < ActiveRecord::Migration
  def change
    add_reference :leads, :campaign, index: true, foreign_key: true
    add_index :leads, :account
  end
end
