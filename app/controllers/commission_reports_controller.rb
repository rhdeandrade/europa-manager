class CommissionReportsController < ApplicationController
  # GET /commission_reports
  # GET /commission_reports.json
  def new
  end

  def index
    start_date = params[:start_date]
    end_date = params[:end_date]
    end_date_year = end_date["date(1i)"]
    end_date_month = end_date["date(2i)"]
    end_date_day = end_date["date(3i)"]

    start_date_year = start_date["date(1i)"]
    start_date_month = start_date["date(2i)"]
    start_date_day = start_date["date(3i)"]

    end_date = Time.local(end_date_year, end_date_month, end_date_day, 0, 0, 0)

    start_date = Time.local(start_date_year, start_date_month, start_date_day, 0, 0, 0)

    @sales = Sale.where(:sold_on.gte => start_date, :sold_on.lte => end_date, employee_id: params[:employee_id])

    @total = 0
    @sales.map{|s| @total += (s.price_commission.to_sgsub(",",".").to_f * s.percentage.gsub.to_s(",",".").to_f) / 100}

  end
end
