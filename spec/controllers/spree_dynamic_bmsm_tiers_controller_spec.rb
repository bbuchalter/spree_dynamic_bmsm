require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SpreeDynamicBmsmTiersController do

  # This should return the minimal set of attributes required to create a valid
  # SpreeDynamicBmsmTier. As you add validations to SpreeDynamicBmsmTier, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "spree_dynamic_bmsm_groups" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpreeDynamicBmsmTiersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all spree_dynamic_bmsm_tiers as @spree_dynamic_bmsm_tiers" do
      spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:spree_dynamic_bmsm_tiers)).to eq([spree_dynamic_bmsm_tier])
    end
  end

  describe "GET show" do
    it "assigns the requested spree_dynamic_bmsm_tier as @spree_dynamic_bmsm_tier" do
      spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
      get :show, {:id => spree_dynamic_bmsm_tier.to_param}, valid_session
      expect(assigns(:spree_dynamic_bmsm_tier)).to eq(spree_dynamic_bmsm_tier)
    end
  end

  describe "GET new" do
    it "assigns a new spree_dynamic_bmsm_tier as @spree_dynamic_bmsm_tier" do
      get :new, {}, valid_session
      expect(assigns(:spree_dynamic_bmsm_tier)).to be_a_new(SpreeDynamicBmsmTier)
    end
  end

  describe "GET edit" do
    it "assigns the requested spree_dynamic_bmsm_tier as @spree_dynamic_bmsm_tier" do
      spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
      get :edit, {:id => spree_dynamic_bmsm_tier.to_param}, valid_session
      expect(assigns(:spree_dynamic_bmsm_tier)).to eq(spree_dynamic_bmsm_tier)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SpreeDynamicBmsmTier" do
        expect {
          post :create, {:spree_dynamic_bmsm_tier => valid_attributes}, valid_session
        }.to change(SpreeDynamicBmsmTier, :count).by(1)
      end

      it "assigns a newly created spree_dynamic_bmsm_tier as @spree_dynamic_bmsm_tier" do
        post :create, {:spree_dynamic_bmsm_tier => valid_attributes}, valid_session
        expect(assigns(:spree_dynamic_bmsm_tier)).to be_a(SpreeDynamicBmsmTier)
        expect(assigns(:spree_dynamic_bmsm_tier)).to be_persisted
      end

      it "redirects to the created spree_dynamic_bmsm_tier" do
        post :create, {:spree_dynamic_bmsm_tier => valid_attributes}, valid_session
        expect(response).to redirect_to(SpreeDynamicBmsmTier.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spree_dynamic_bmsm_tier as @spree_dynamic_bmsm_tier" do
        # Trigger the behavior that occurs when invalid params are submitted
        SpreeDynamicBmsmTier.any_instance.stub(:save).and_return(false)
        post :create, {:spree_dynamic_bmsm_tier => { "spree_dynamic_bmsm_groups" => "invalid value" }}, valid_session
        expect(assigns(:spree_dynamic_bmsm_tier)).to be_a_new(SpreeDynamicBmsmTier)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SpreeDynamicBmsmTier.any_instance.stub(:save).and_return(false)
        post :create, {:spree_dynamic_bmsm_tier => { "spree_dynamic_bmsm_groups" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested spree_dynamic_bmsm_tier" do
        spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
        # Assuming there are no other spree_dynamic_bmsm_tiers in the database, this
        # specifies that the SpreeDynamicBmsmTier created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(SpreeDynamicBmsmTier).to receive(:update).with({ "spree_dynamic_bmsm_groups" => "" })
        put :update, {:id => spree_dynamic_bmsm_tier.to_param, :spree_dynamic_bmsm_tier => { "spree_dynamic_bmsm_groups" => "" }}, valid_session
      end

      it "assigns the requested spree_dynamic_bmsm_tier as @spree_dynamic_bmsm_tier" do
        spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
        put :update, {:id => spree_dynamic_bmsm_tier.to_param, :spree_dynamic_bmsm_tier => valid_attributes}, valid_session
        expect(assigns(:spree_dynamic_bmsm_tier)).to eq(spree_dynamic_bmsm_tier)
      end

      it "redirects to the spree_dynamic_bmsm_tier" do
        spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
        put :update, {:id => spree_dynamic_bmsm_tier.to_param, :spree_dynamic_bmsm_tier => valid_attributes}, valid_session
        expect(response).to redirect_to(spree_dynamic_bmsm_tier)
      end
    end

    describe "with invalid params" do
      it "assigns the spree_dynamic_bmsm_tier as @spree_dynamic_bmsm_tier" do
        spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SpreeDynamicBmsmTier.any_instance.stub(:save).and_return(false)
        put :update, {:id => spree_dynamic_bmsm_tier.to_param, :spree_dynamic_bmsm_tier => { "spree_dynamic_bmsm_groups" => "invalid value" }}, valid_session
        expect(assigns(:spree_dynamic_bmsm_tier)).to eq(spree_dynamic_bmsm_tier)
      end

      it "re-renders the 'edit' template" do
        spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SpreeDynamicBmsmTier.any_instance.stub(:save).and_return(false)
        put :update, {:id => spree_dynamic_bmsm_tier.to_param, :spree_dynamic_bmsm_tier => { "spree_dynamic_bmsm_groups" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested spree_dynamic_bmsm_tier" do
      spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
      expect {
        delete :destroy, {:id => spree_dynamic_bmsm_tier.to_param}, valid_session
      }.to change(SpreeDynamicBmsmTier, :count).by(-1)
    end

    it "redirects to the spree_dynamic_bmsm_tiers list" do
      spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.create! valid_attributes
      delete :destroy, {:id => spree_dynamic_bmsm_tier.to_param}, valid_session
      expect(response).to redirect_to(spree_dynamic_bmsm_tiers_url)
    end
  end

end
