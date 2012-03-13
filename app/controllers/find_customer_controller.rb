class FindCustomerController < ApplicationController
  def index
    puts params
    @customers = Customer.where(name: /^#{params[:customer_name]}/i)
  end

  def new
  end

end
