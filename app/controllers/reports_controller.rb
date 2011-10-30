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
      date = Time.now
      date = date - (60 * 60 * 24 * 365 * 2)
      customers.each {|c| @sales += Sale.where(customer_id: c.id, change_chamber: false, :last_change_on.lte => date )}
    elsif params[:city] != ""
      customers = Customer.where(city: params[:city])
      @sales = []
      date = Time.now
      date = date - (60 * 60 * 24 * 365 * 2)
      customers.each {|c| @sales += Sale.where(customer_id: c.id, change_chamber: false, :last_change_on.lte => date )}
    elsif params[:neighborhood] != ""
      customers = Customer.where(neighborhood: params[:neighborhood])
      @sales = []
      date = Time.now
      date = date - (60 * 60 * 24 * 365 * 2)
      customers.each {|c| @sales += Sale.where(customer_id: c.id, change_chamber: false, :last_change_on.lte => date )}
    else
      @sales = Sale.all
    end
  end
end
