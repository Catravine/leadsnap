require 'rails_helper'

RSpec.describe Recall, type: :model do

  let(:my_user) { create(:user) }
  let(:my_campaign) { create(:campaign, name: "Fake Campaign") }
  let(:my_lead) { create(:lead, campaign_id: my_campaign.id) }
  let(:my_callback) { create(:callback, lead: my_lead, user: my_user) }

  it { should respond_to(:user) }
  it { should respond_to(:lead) }
  it { should respond_to(:time) }
  it { should respond_to(:notes) }

  it { should belong_to(:user) }
  it { should belong_to(:lead) }

end
