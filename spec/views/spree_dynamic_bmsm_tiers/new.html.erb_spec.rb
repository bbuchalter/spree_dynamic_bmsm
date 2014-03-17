require 'spec_helper'

describe "spree_dynamic_bmsm_tiers/new" do
  before(:each) do
    assign(:spree_dynamic_bmsm_tier, stub_model(SpreeDynamicBmsmTier,
      :spree_dynamic_bmsm_groups => "",
      :label => "MyString",
      :level => 1.5,
      :discount => 1.5
    ).as_new_record)
  end

  it "renders new spree_dynamic_bmsm_tier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spree_dynamic_bmsm_tiers_path, "post" do
      assert_select "input#spree_dynamic_bmsm_tier_spree_dynamic_bmsm_groups[name=?]", "spree_dynamic_bmsm_tier[spree_dynamic_bmsm_groups]"
      assert_select "input#spree_dynamic_bmsm_tier_label[name=?]", "spree_dynamic_bmsm_tier[label]"
      assert_select "input#spree_dynamic_bmsm_tier_level[name=?]", "spree_dynamic_bmsm_tier[level]"
      assert_select "input#spree_dynamic_bmsm_tier_discount[name=?]", "spree_dynamic_bmsm_tier[discount]"
    end
  end
end
