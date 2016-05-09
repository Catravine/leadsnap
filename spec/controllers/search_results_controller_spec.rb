require 'rails_helper'

RSpec.describe SearchResultsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_admin) { create(:user, role: 2)}
  let(:my_campaign) { create(:campaign) }

  context "guest user" do
    describe "non-signed in stuff" do
      it "redirects to non-signed-in to sign_in_path" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "signed in standard user" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end
