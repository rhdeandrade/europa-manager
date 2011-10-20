require 'spec_helper'

describe "customers/edit.html.haml" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :name => "MyString",
      :cpf => "MyString",
      :rg => "MyString",
      :address => "MyString",
      :neighborhood => "MyString",
      :city => "MyString",
      :cep => "MyString",
      :work_address => "MyString",
      :phone_number => "MyString",
      :mobile_phone => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path(@customer), :method => "post" do
      assert_select "input#customer_name", :name => "customer[name]"
      assert_select "input#customer_cpf", :name => "customer[cpf]"
      assert_select "input#customer_rg", :name => "customer[rg]"
      assert_select "input#customer_address", :name => "customer[address]"
      assert_select "input#customer_neighborhood", :name => "customer[neighborhood]"
      assert_select "input#customer_city", :name => "customer[city]"
      assert_select "input#customer_cep", :name => "customer[cep]"
      assert_select "input#customer_work_address", :name => "customer[work_address]"
      assert_select "input#customer_phone_number", :name => "customer[phone_number]"
      assert_select "input#customer_mobile_phone", :name => "customer[mobile_phone]"
    end
  end
end
