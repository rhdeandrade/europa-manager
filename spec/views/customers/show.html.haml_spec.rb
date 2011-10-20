require 'spec_helper'

describe "customers/show.html.haml" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cpf/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Rg/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Neighborhood/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cep/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Work Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mobile Phone/)
  end
end
