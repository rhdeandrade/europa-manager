require 'spec_helper'

describe "employees/index.html.haml" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :name => "Name",
        :cpf => "Cpf"
      ),
      stub_model(Employee,
        :name => "Name",
        :cpf => "Cpf"
      )
    ])
  end

  it "renders a list of employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
  end
end
