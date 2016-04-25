require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do

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
      it "is unauthorized" do
        get :new
        expect(response).to have_http_status(302)
      end
    end

    describe "POST #create" do
      it "is unauthorized" do
        post :create, campaign: { name: "new test campaign 1" }
        expect(response).to have_http_status(302)
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

    describe "GET #edit" do
      it "is unauthorized" do
        get :edit, {id: my_campaign.id}
        expect(response).to have_http_status(302)
      end
    end

    describe "PUT #update" do
      it "is unauthorized" do
        put :update, id: my_campaign.id, campaign: {name: "Updated Campaign"}
        expect(response).to have_http_status(302)
      end
    end

    describe "DELETE #destroy" do
      it "is unauthorized" do
        delete :destroy, {id: my_campaign.id}
        expect(response).to have_http_status(302)
      end
    end
  end

  context "signed in admin user" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_admin
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

    describe "GET #edit" do
      it "returns http success" do
        get :edit, {id: my_campaign.id}
        expect(response).to render_template("edit")
      end

      it "assigns campaign to be updated to @campaign" do
        get :edit, {id: my_campaign.id}
        campaign_instance = assigns(:campaign)
        expect(campaign_instance.name).to eq my_campaign.name
      end
    end

    describe "PUT #update" do
      # it "updates campaign with expected attributes" do
      #   new_name = "Updated Campaign 1"
      #   put :update, id: my_campaign.id, camapaign: {name: new_name}
      #   updated_campaign = assigns(:campaign)
      #   expect(updated_campaign.id).to eq my_campaign.id
      #   expect(updated_campaign.title).to eq new_name
      # end

      it "redirects to updated campaign" do
        new_name = "Updated Campaign 2"
        put :update, id: my_campaign.id, campaign: {name: new_name}
        expect(response).to redirect_to my_campaign
      end
    end

    describe "DELETE #destroy" do
      it "deletes the post" do
        delete :destroy, {id: my_campaign.id}
        count = Campaign.where({id: my_campaign.id}).size
        expect(count).to eq 0
      end

      it "redirects to campaign index" do
        delete :destroy, {id: my_campaign.id}
        expect(response).to redirect_to campaigns_path
      end
    end
  end
end
