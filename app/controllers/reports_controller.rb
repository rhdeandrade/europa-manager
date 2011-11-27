class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.json
  def new
  end

  def create

  end

  def index
    c = params[:city]

    products24 = Product.where(validity: 24)
    products12 = Product.where(validity: 12)

    if c[:city] != "" && params[:neighborhood] != ""
      customers = Customer.where(city: c[:city], neighborhood: params[:neighborhood])

      @sales = []
      date = Time.now
      date = date - (60 * 60 * 24 * 365)
      customers.each {|c| products12.each {|p| @sales += Sale.where(customer_id: c.id, change_chamber: false, :last_change_on.lte => date, product_id: p.id)}}

      date = Time.now
      date = date - (60 * 60 * 24 * 365 * 2)
      customers.each {|c| products24.each {|p| @sales += Sale.where(customer_id: c.id, change_chamber: false, :last_change_on.lte => date, product_id: p.id)}}

    elsif c[:city] != ""
      customers = Customer.where(city: c[:city])

      @sales = []
      date = Time.now
      date = date - (60 * 60 * 24 * 365)
      customers.each {|c| products12.each {|p| @sales += Sale.where(customer_id: c.id, change_chamber: false, :last_change_on.lte => date, product_id: p.id)}}

      date = Time.now
      date = date - (60 * 60 * 24 * 365 * 2)
      customers.each {|c| products24.each {|p| @sales += Sale.where(customer_id: c.id, change_chamber: false, :last_change_on.lte => date, product_id: p.id)}}

    elsif params[:neighborhood] != ""
      customers = Customer.where(neighborhood: params[:neighborhood])

      @sales = []
      date = Time.now
      date = date - (60 * 60 * 24 * 365)
      customers.each {|c| products12.each {|p| @sales += Sale.where(customer_id: c.id, change_chamber: false, :last_change_on.lte => date, product_id: p.id)}}

      date = Time.now
      date = date - (60 * 60 * 24 * 365 * 2)
      customers.each {|c| products24.each {|p| @sales += Sale.where(customer_id: c.id, change_chamber: false, :last_change_on.lte => date, product_id: p.id)}}
    else
      @sales = Sale.all
    end
  end
end
