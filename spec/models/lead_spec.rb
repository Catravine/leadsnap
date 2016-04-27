require 'rails_helper'

RSpec.describe Lead, type: :model do

  let(:my_user) { create(:user) }
  let(:my_admin) { create(:user, role: 2)}
  let(:my_campaign) { create(:campaign, name: "Fake Campaign") }
  let(:my_lead) { create(:lead, campaign_id: my_campaign.id) }

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

  it { should belong_to(:campaign) }

end
