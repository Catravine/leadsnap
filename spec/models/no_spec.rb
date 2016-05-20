require 'rails_helper'

RSpec.describe No, type: :model do

  let(:my_user) { create(:user) }
  let(:my_campaign) { create(:campaign, name: "Fake Campaign") }
  let(:my_lead) { create(:lead, campaign_id: my_campaign.id) }
  let(:my_no) { create(:no, lead: my_lead, user: my_user) }

  it { should respond_to(:user) }
  it { should respond_to(:lead) }
  it { should respond_to(:date) }

  it { should belong_to(:user) }
  it { should belong_to(:lead) }

end
