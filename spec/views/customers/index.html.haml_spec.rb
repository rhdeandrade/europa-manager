require 'spec_helper'

describe "customers/index.html.haml" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :name => "Name",
        :cpf => "Cpf",
        :rg => "Rg",
        :address => "Address",
        :neighborhood => "Neighborhood",
        :city => "City",
        :cep => "Cep",
        :work_address => "Work Address",
        :phone_number => "Phone Number",
        :mobile_phone => "Mobile Phone"
      ),
      stub_model(Customer,
        :name => "Name",
        :cpf => "Cpf",
        :rg => "Rg",
        :address => "Address",
        :neighborhood => "Neighborhood",
        :city => "City",
        :cep => "Cep",
        :work_address => "Work Address",
        :phone_number => "Phone Number",
        :mobile_phone => "Mobile Phone"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Neighborhood".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Work Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mobile Phone".to_s, :count => 2
  end
end
