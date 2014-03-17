require "spec_helper"

describe SpreeDynamicBmsmGroupsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spree_dynamic_bmsm_groups").to route_to("spree_dynamic_bmsm_groups#index")
    end

    it "routes to #new" do
      expect(:get => "/spree_dynamic_bmsm_groups/new").to route_to("spree_dynamic_bmsm_groups#new")
    end

    it "routes to #show" do
      expect(:get => "/spree_dynamic_bmsm_groups/1").to route_to("spree_dynamic_bmsm_groups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spree_dynamic_bmsm_groups/1/edit").to route_to("spree_dynamic_bmsm_groups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spree_dynamic_bmsm_groups").to route_to("spree_dynamic_bmsm_groups#create")
    end

    it "routes to #update" do
      expect(:put => "/spree_dynamic_bmsm_groups/1").to route_to("spree_dynamic_bmsm_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spree_dynamic_bmsm_groups/1").to route_to("spree_dynamic_bmsm_groups#destroy", :id => "1")
    end

  end
end
