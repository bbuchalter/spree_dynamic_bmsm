require 'spec_helper'

describe "spree_dynamic_bmsm_groups/new" do
  before(:each) do
    assign(:spree_dynamic_bmsm_group, stub_model(SpreeDynamicBmsmGroup,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new spree_dynamic_bmsm_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spree_dynamic_bmsm_groups_path, "post" do
      assert_select "input#spree_dynamic_bmsm_group_name[name=?]", "spree_dynamic_bmsm_group[name]"
      assert_select "input#spree_dynamic_bmsm_group_description[name=?]", "spree_dynamic_bmsm_group[description]"
    end
  end
end
