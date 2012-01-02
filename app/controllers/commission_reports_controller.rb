class CommissionReportsController < ApplicationController
  # GET /commission_reports
  # GET /commission_reports.json
  def new
  end

  def index
    puts params[:employee_id]
    params[:start_date]
    data_inicio = filter_time(params, :start_date)
    puts data_inicio
  end
end
