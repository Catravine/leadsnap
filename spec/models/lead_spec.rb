require 'rails_helper'

RSpec.describe Lead, type: :model do

  let(:my_user) { create(:user) }
  let(:my_admin) { create(:user, role: 2)}
  let(:my_campaign) { create(:campaign, name: "Fake Campaign") }
  let(:my_lead) { create(:lead, campaign_id: my_campaign.id) }

  # Contact info from calling lists
  it { should respond_to(:account) }
  it { should respond_to(:name1) }
  it { should respond_to(:name2) }
  it { should respond_to(:address1) }
  it { should respond_to(:address2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:phone1) }
  it { should respond_to(:phone2) }
  it { should respond_to(:phone3) }
  it { should respond_to(:source_code) }

  # Extra colums for tracking functionality
  it { should respond_to(:last_dialed) }
  it { should respond_to(:dial_count) }

  it { should belong_to(:campaign) }

  describe "#campaign_name" do
    it "returns the name of the campaign" do
      expect(my_lead.campaign_name).to eq my_campaign.name
    end
  end

  describe "#campaign_notes" do
    it "returns the notes of the campaign" do
      expect(my_lead.campaign_notes).to eq my_campaign.notes
    end
  end

  describe "#campaign_code" do
    it "returns the code of the campaign" do
      expect(my_lead.campaign_code).to eq my_campaign.code
    end
  end

  describe "#campaign_phone" do
    it "returns the phone of the campaign" do
      expect(my_lead.campaign_phone).to eq my_campaign.callback_phone
    end
  end

  describe "#dial_lead" do
    it "increases dial_count by 1" do
      my_lead.dial_lead
      expect(my_lead.dial_count).to eq 1
    end
  end

end
