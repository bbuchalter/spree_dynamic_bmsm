require 'spec_helper'

describe "spree_dynamic_bmsm_groups/edit" do
  before(:each) do
    @spree_dynamic_bmsm_group = assign(:spree_dynamic_bmsm_group, stub_model(SpreeDynamicBmsmGroup,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit spree_dynamic_bmsm_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spree_dynamic_bmsm_group_path(@spree_dynamic_bmsm_group), "post" do
      assert_select "input#spree_dynamic_bmsm_group_name[name=?]", "spree_dynamic_bmsm_group[name]"
      assert_select "input#spree_dynamic_bmsm_group_description[name=?]", "spree_dynamic_bmsm_group[description]"
    end
  end
end
