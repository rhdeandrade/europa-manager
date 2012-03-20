class SalesController < ApplicationController
  # GET /sales
  # GET /sales.json

  def index
    if params[:customer_id]
      @sales = Sale.where(customer_id: params[:customer_id], :change_chamber => "false")
    else
      @sales = Sale.order_by([[ :sold_on, :desc ]]).page(params[:page]).per(30)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales.map {|s| { id: s.id, product_name: s.product.name }} }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @sale = Sale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(params[:sale])
    @sale.sold_on = filter_time(params[:sale], :sold_on)

    @sale.last_change_on = @sale.sold_on
    if @sale.change_chamber
      sale_old = Sale.find(@sale.sale_id)
      sale_old.last_change_on = @sale.sold_on
      sale_old.save
    end


    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Venda efetuada com sucesso.' }
        format.json { render json: @sale, status: :created, location: @sale }
      else
        format.html { render action: "new" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        @sale.sold_on = filter_time(params[:sale], :sold_on)
        format.html { redirect_to @sale, notice: 'Venda alterada com sucesso.' }
        format.json { head :ok }
        @sale.save
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :ok }
    end
  end

end
