require 'spec_helper'

describe "sales/show.html.haml" do
  before(:each) do
    @sale = assign(:sale, stub_model(Sale,
      :change_chamber => false,
      :price => 1.5,
      :customer_id => "Customer",
      :product_id => "Product"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Customer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Product/)
  end
end
