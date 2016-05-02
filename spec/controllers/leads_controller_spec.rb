require 'rails_helper'

RSpec.describe LeadsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_manager) { create(:user, role: 1) }
  let(:my_admin) { create(:user, role: 2)}
  let(:my_campaign) { create(:campaign) }
  let(:my_lead) { create(:lead, campaign_id: my_campaign) }

  context "guest user" do
    describe "non-signed in stuff" do
      it "redirects to non-signed-in to sign_in_path" do
        get :show, {campaign_id: my_campaign.id, id: my_lead.id}
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
      it "is unauthorized" do
        get :index, {campaign_id: my_campaign.id}
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #show" do
      it "renders the #show view" do
        get :show, {campaign_id: my_campaign.id, id: my_lead.id}
        expect(response).to render_template("show")
      end

      it "assigns my_lead to @lead" do
        get :show, {campaign_id: my_campaign.id, id: my_lead.id}
        expect(assigns(:lead)).to eq(my_lead)
      end
    end

    describe "GET #edit" do
      it "assigns lead to be updated to @lead" do
        get :edit, {campaign_id: my_campaign.id, id: my_lead.id}
        lead_instance = assigns(:lead)
        expect(lead_instance.name1).to eq my_lead.name1
      end
    end
  end

  context "signed in manager user" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_manager
    end

    describe "GET #index" do
      it "renders the #index view" do
        get :index, {campaign_id: my_campaign.id}
        expect(response).to render_template("index")
      end

      it "assigns all leads in the campaign to @leads" do
        get :index, {campaign_id: my_campaign.id}
        expect(assigns(:leads)).not_to be_nil
      end
    end

    describe "GET #show" do
      it "renders the #show view" do
        get :show, {campaign_id: my_campaign.id, id: my_lead.id}
        expect(response).to render_template("show")
      end

      it "assigns my_lead to @lead" do
        get :show, {campaign_id: my_campaign.id, id: my_lead.id}
        expect(assigns(:lead)).to eq(my_lead)
      end
    end

    describe "GET #edit" do
      it "assigns lead to be updated to @lead" do
        get :edit, {campaign_id: my_campaign.id, id: my_lead.id}
        lead_instance = assigns(:lead)
        expect(lead_instance.name1).to eq my_lead.name1
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
      it "renders the #index view" do
        get :index, {campaign_id: my_campaign.id}
        expect(response).to render_template("index")
      end

      it "assigns all leads in the campaign to @leads" do
        get :index, {campaign_id: my_campaign.id}
        expect(assigns(:leads)).not_to be_nil
      end
    end

    describe "GET #show" do
      it "renders the #show view" do
        get :show, {campaign_id: my_campaign.id, id: my_lead.id}
        expect(response).to render_template("show")
      end

      it "assigns my_lead to @lead" do
        get :show, {campaign_id: my_campaign.id, id: my_lead.id}
        expect(assigns(:lead)).to eq(my_lead)
      end
    end

    describe "GET #edit" do
      it "assigns lead to be updated to @lead" do
        get :edit, {campaign_id: my_campaign.id, id: my_lead.id}
        lead_instance = assigns(:lead)
        expect(lead_instance.name1).to eq my_lead.name1
      end
    end
  end
end
