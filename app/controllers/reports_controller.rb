class ReportsController < ApplicationController
	# GET /reports
  # GET /reports.json
  def new
  end

  def create
    
  end

  def index
    if params[:city] != "" && params[:neighborhood] != ""
      customers = Customer.where(city: params[:city], neighborhood: params[:neighborhood])
      @sales = []
      customers.each {|c| @sales += c.sales }
    elsif params[:city] != ""
      customers = Customer.where(city: params[:city])
      @sales = []
      customers.each {|c| @sales += c.sales }
    elsif params[:neighborhood] != ""
      customers = Customer.where(neighborhood: params[:neighborhood])
      @sales = []
      customers.each {|c| @sales += c.sales }
    else
      @sales = Sale.all
    end
  end
end
