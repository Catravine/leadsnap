require 'spec_helper'

describe LeadsHelper do

  let(:my_user) { create(:user) }
  let(:my_admin) { create(:user, role: 2)}
  let(:my_campaign) { create(:campaign, name: "Fake Campaign") }
  let(:my_lead) { create(:lead, campaign_id: my_campaign.id) }

  describe "#campaign_name(lead)" do
    it "returns the name of the campaign" do
      expect(campaign_name(my_lead)).to eq my_campaign.name
    end
  end

  describe "#campaign_notes(lead)" do
    it "returns the notes of the campaign" do
      expect(campaign_notes(my_lead)).to eq my_campaign.notes
    end
  end

  describe "#campaign_code(lead)" do
    it "returns the code of the campaign" do
      expect(campaign_code(my_lead)).to eq my_campaign.code
    end
  end

  describe "#campaign_phone(lead)" do
    it "returns the phone of the campaign" do
      expect(campaign_phone(my_lead)).to eq my_campaign.callback_phone
    end
  end

end
