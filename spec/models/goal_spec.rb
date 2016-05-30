require 'rails_helper'

RSpec.describe Goal, type: :model do

  let(:my_campaign) { create(:campaign, name: "Fake Campaign") }
  let(:my_goal) { create(:goal, campaign_id: my_campaign.id, amount: 100000) }

  it { should respond_to(:amount) }
  it { should respond_to(:individual) }
  it { should respond_to(:weekly) }
  it { should respond_to(:campaign_id) }

  describe "#deadline" do
    it "returns the absolute deadline based on whether its weekly or daily" do
      expect(my_goal.deadline).to eq (Date.today.sunday + 5).beginning_of_day
      @daily_goal = create(:goal, weekly: false, amount: 3000, campaign_id: my_campaign.id)
      expect(@daily_goal.deadline).to eq Date.tomorrow.beginning_of_day
    end
  end

end
