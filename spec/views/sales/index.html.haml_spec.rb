require 'spec_helper'

describe "sales/index.html.haml" do
  before(:each) do
    assign(:sales, [
      stub_model(Sale,
        :change_chamber => false,
        :price => 1.5,
        :customer_id => "Customer",
        :product_id => "Product"
      ),
      stub_model(Sale,
        :change_chamber => false,
        :price => 1.5,
        :customer_id => "Customer",
        :product_id => "Product"
      )
    ])
  end

  it "renders a list of sales" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Customer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Product".to_s, :count => 2
  end
end
