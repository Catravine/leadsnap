require 'rails_helper'

RSpec.describe Lead, type: :model do
  let(:my_lead) { create(:lead) }

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
end
