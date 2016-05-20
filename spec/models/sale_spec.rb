require 'rails_helper'

RSpec.describe Sale, type: :model do

  let(:my_user) { create(:user) }
  let(:my_campaign) { create(:campaign, name: "Fake Campaign") }
  let(:my_lead) { create(:lead, campaign_id: my_campaign.id) }
  let(:my_sale) { create(:sale, lead: my_lead, user: my_user) }

  it { should respond_to(:user) }
  it { should respond_to(:lead) }
  it { should respond_to(:date) }
  it { should respond_to(:amount) }

  it { should belong_to(:user) }
  it { should belong_to(:lead) }

end
