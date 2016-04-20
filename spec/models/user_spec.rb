require 'rails_helper'

RSpec.describe User, type: :model do

  let(:standard_user) { create(:user) }
  let(:admin_user) { create(:user, role: 2) }
  let(:user_caroline) { create(:user, email: "caroline@example.com") }
  let(:approval_user) { create(:user, approved: false) }

  it { should respond_to(:email) }
  it { should respond_to(:nickname) }
  it { should respond_to(:role) }
  it { should respond_to(:fullname) }
  it { should respond_to(:phone) }
  it { should respond_to(:approved) }

  describe "user roles" do
    it "is standard user by default" do
      expect(standard_user.role).to eq("standard")
    end
  end

  describe "nickname parameter" do
    it "defaultedly assigns the humanized email username to nickname" do
      expect(user_caroline.nickname).to eq "Caroline"
    end
  end

end
