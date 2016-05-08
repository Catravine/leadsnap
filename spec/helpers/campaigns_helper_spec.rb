require 'spec_helper'

describe CampaignsHelper do

  let(:my_user) { create(:user) }
  let(:my_admin) { create(:user, role: 2)}
  let(:my_campaign) { create(:campaign, name: "Fake Campaign") }
  let(:my_lead) { create(:lead, campaign_id: my_campaign.id) }
  let(:my_killed_lead) { create(:lead, campaign_id: my_campaign.id, killed: true) }
  let(:my_disconnected_lead) { create(:lead, campaign_id: my_campaign.id, disconnected: true) }
  let(:my_day_lead) { create(:lead, campaign_id: my_campaign.id, day_lead: true) }

  describe "#all_leads(campaign)" do
    it "returns a collection all leads of the campaign" do
      expect(all_leads(my_campaign)).to include(my_killed_lead, my_disconnected_lead)
    end
  end

  describe "#all_valid_leads(campaign)" do
    it "returns a collection of all non-killed, etc leads" do
      expect(all_valid_leads(my_campaign)).to eq [my_lead]
    end
  end

  describe "#all_day_leads(campaign)" do
    it "returns a collection of all daytime leads" do
      expect(all_day_leads(my_campaign)).to eq [my_day_lead]
    end
  end

end
