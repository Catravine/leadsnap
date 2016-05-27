require 'spec_helper'

describe CampaignsHelper do

  let(:my_user) { create(:user) }
  let(:my_campaign) { create(:campaign, name: "Fake Campaign") }

  describe "#csv_download_path(campaign)" do
    it "returns a path to a generated csv file of the campaign" do
      expect(csv_download_path(my_campaign)).to eq "#{my_campaign.id}/leads.csv"
    end
  end

end
