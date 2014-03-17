require 'spec_helper'

describe "spree_dynamic_bmsm_tiers/index" do
  before(:each) do
    assign(:spree_dynamic_bmsm_tiers, [
      stub_model(SpreeDynamicBmsmTier,
        :spree_dynamic_bmsm_groups => "",
        :label => "Label",
        :level => 1.5,
        :discount => 1.5
      ),
      stub_model(SpreeDynamicBmsmTier,
        :spree_dynamic_bmsm_groups => "",
        :label => "Label",
        :level => 1.5,
        :discount => 1.5
      )
    ])
  end

  it "renders a list of spree_dynamic_bmsm_tiers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
