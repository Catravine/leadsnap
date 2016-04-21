require 'rails_helper'

RSpec.describe Campaign, type: :model do

  let(:my_campaign) { create(:campaign) }

  it { should respond_to(:name) }
  it { should respond_to(:year) }
  it { should respond_to(:code) }
  it { should respond_to(:callback_phone) }
  it { should respond_to(:notes) }
end