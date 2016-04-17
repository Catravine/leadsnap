require 'rails_helper'

RSpec.describe User, type: :model do

  let(:my_user) { create(:user) }

  it { should respond_to(:email) }

  describe "factory girl works" do
    it "should set a user with password 'password'" do
      expect(my_user.password).to eq "password"
    end
  end

end
