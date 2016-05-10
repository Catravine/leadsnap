require 'rails_helper'

RSpec.describe CallbacksController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_campaign) { create(:campaign) }
  let(:my_lead) { create(:lead, campaign_id: my_campaign) }
  let(:my_callback) { create(:callback, user: my_user, lead: my_lead, time: Time.now, notes: "fake notes") }

  context "guest user" do
    describe "non-signed in stuff" do
      it "redirects to non-signed-in to sign_in_path" do
        post :create, callback: { user: my_user, lead: my_lead }
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

    # describe "GET #new" do
    #   it "instantiates @callback" do
    #     get :new
    #     expect(assigns(:callback)).not_to be_nil
    #   end
    # end
    #
    # describe "POST #create" do
    #   it "assigns the new callback to @callback" do
    #     post :create, callback: { user: my_user, lead: my_lead }
    #     expect(assigns(:callback)).to eq Callback.last
    #   end
    # end

    describe "PUT #update" do
    end

    describe "DELETE #destroy" do
    end
  end

end
