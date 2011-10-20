require 'spec_helper'

describe "sales/new.html.haml" do
  before(:each) do
    assign(:sale, stub_model(Sale,
      :change_chamber => false,
      :price => 1.5,
      :customer_id => "MyString",
      :product_id => "MyString"
    ).as_new_record)
  end

  it "renders new sale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sales_path, :method => "post" do
      assert_select "input#sale_change_chamber", :name => "sale[change_chamber]"
      assert_select "input#sale_price", :name => "sale[price]"
      assert_select "input#sale_customer_id", :name => "sale[customer_id]"
      assert_select "input#sale_product_id", :name => "sale[product_id]"
    end
  end
end
