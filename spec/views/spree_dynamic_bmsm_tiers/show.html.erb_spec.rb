require 'spec_helper'

describe "spree_dynamic_bmsm_tiers/show" do
  before(:each) do
    @spree_dynamic_bmsm_tier = assign(:spree_dynamic_bmsm_tier, stub_model(SpreeDynamicBmsmTier,
      :spree_dynamic_bmsm_groups => "",
      :label => "Label",
      :level => 1.5,
      :discount => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(//)
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
