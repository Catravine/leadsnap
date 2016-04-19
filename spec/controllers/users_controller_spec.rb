require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:my_user) { create(:user) }

  context "guest user" do
  end

  context "signed in user" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_user
    end

    describe "stuff" do
    end

  end

end
