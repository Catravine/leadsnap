require 'rails_helper'

RSpec.describe RecallsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_campaign) { create(:campaign) }
  let(:my_lead) { create(:lead, campaign_id: my_campaign) }
  let(:my_recall) { create(:recall, user: my_user, lead: my_lead, time: Time.now, notes: "fake notes") }

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

    describe "GET #new" do
      it "instantiates @recall" do
        get :new
        expect(assigns(:recall)).not_to be_nil
      end
    end

    describe "DELETE #destroy" do
      it "deletes the recall" do
        delete :destroy, { id: my_recall.id }
        expect(Recall.where({id: my_recall.id}).count).to eq 0
      end
    end
  end

end
