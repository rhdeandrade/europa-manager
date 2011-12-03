require 'spec_helper'

describe "employees/show.html.haml" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :name => "Name",
      :cpf => "Cpf"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cpf/)
  end
end
