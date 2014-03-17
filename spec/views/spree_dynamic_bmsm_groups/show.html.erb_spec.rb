require 'spec_helper'

describe "spree_dynamic_bmsm_groups/show" do
  before(:each) do
    @spree_dynamic_bmsm_group = assign(:spree_dynamic_bmsm_group, stub_model(SpreeDynamicBmsmGroup,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
