require 'rails_helper'

RSpec.describe Campaign, type: :model do

  let(:my_campaign) { create(:campaign) }

  it { should respond_to(:name) }
  it { should respond_to(:year) }
  it { should respond_to(:code) }
  it { should respond_to(:callback_phone) }
  it { should respond_to(:notes) }
  it { should respond_to(:available) }
  it { should respond_to(:round) }
  it { should respond_to(:days_old_nos) }

  it { should have_many(:leads) }

end
