require "spec_helper"

describe SpreeDynamicBmsmTiersController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spree_dynamic_bmsm_tiers").to route_to("spree_dynamic_bmsm_tiers#index")
    end

    it "routes to #new" do
      expect(:get => "/spree_dynamic_bmsm_tiers/new").to route_to("spree_dynamic_bmsm_tiers#new")
    end

    it "routes to #show" do
      expect(:get => "/spree_dynamic_bmsm_tiers/1").to route_to("spree_dynamic_bmsm_tiers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spree_dynamic_bmsm_tiers/1/edit").to route_to("spree_dynamic_bmsm_tiers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spree_dynamic_bmsm_tiers").to route_to("spree_dynamic_bmsm_tiers#create")
    end

    it "routes to #update" do
      expect(:put => "/spree_dynamic_bmsm_tiers/1").to route_to("spree_dynamic_bmsm_tiers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spree_dynamic_bmsm_tiers/1").to route_to("spree_dynamic_bmsm_tiers#destroy", :id => "1")
    end

  end
end
