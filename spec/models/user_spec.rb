require 'rails_helper'

RSpec.describe User, type: :model do

  let(:standard_user) { create(:user) }
  let(:admin_user) { create(:user, role: 2) }

  it { should respond_to(:email) }
  it { should respond_to(:nickname) }
  it { should respond_to(:role) }

  describe "user roles" do
    it "is standard user by default" do
      expect(standard_user.role).to eq("standard")
    end
  end

end
