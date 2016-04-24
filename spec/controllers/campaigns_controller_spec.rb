require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_campaign) { create(:campaign) }

  context "guest user" do
    describe "non-signed in stuff" do
      it "redirects to non-signed-in to sign_in_path" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "signed in user" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_user
    end

    describe "GET #index" do
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

      it "assigns [my_campaign] to @campaigns" do
        get :index
        expect(assigns(:campaigns)).to eq([my_campaign])
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to render_template("new")
      end

      it "instantiates @campaign" do
        get :new
        expect(assigns(:campaign)).not_to be_nil
      end
    end

    describe "POST #create" do
      it "assigns the new campaign to @campaign" do
        post :create, campaign: { name: "new test campaign 1" }
        expect(assigns(:campaign)).to eq Campaign.last
      end

      it "redirects to the new campaign page" do
        post :create, campaign: { name: "new test campaign 2" }
        expect(response).to redirect_to Campaign.last
      end
    end

    describe "GET #show" do
      it "renders the #show view" do
        get :show, {id: my_campaign.id}
        expect(response).to render_template("show")
      end

      it "assigns my_campaign to @campaign" do
        get :show, {id: my_campaign.id}
        expect(assigns(:campaign)).to eq(my_campaign)
      end
    end

    # describe "GET #edit" do
    #   it "returns http success" do
    #     get :edit
    #     expect(response).to have_http_status(:success)
    #   end
    # end

  end
end
