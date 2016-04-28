require 'rails_helper'

RSpec.describe LeadsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_admin) { create(:user, role: 2)}
  let(:my_campaign) { create(:campaign) }
  let(:my_lead) { create(:lead) }

  context "guest user" do
    describe "non-signed in stuff" do
      it "redirects to non-signed-in to sign_in_path" do
        get :show, id: my_lead.id
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
      it "renders the #index view" do
        get :index
        expect(response).to render_template("index")
      end

      it "assigns all leads @leads" do
        get :index
        expect(assigns(:leads)).to eq([my_lead])
      end
    end

    describe "GET #show" do
      it "renders the #show view" do
        get :show, {id: my_lead.id}
        expect(response).to render_template("show")
      end

      it "assigns my_lead to @lead" do
        get :show, {id: my_lead.id}
        expect(assigns(:lead)).to eq(my_lead)
      end
    end
  end
end
