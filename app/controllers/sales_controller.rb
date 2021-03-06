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
    @sale.price = @sale.price.to_s.gsub(",",".").to_f
    @sale.percentage = @sale.percentage.to_s.gsub(",",".").to_f
    @sale.price_commission = @sale.price_commission.to_s.gsub(",",".").to_f


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

    if @sale != nil
      s = params[:sale]
      @sale.sold_on = filter_time(s, :sold_on)
      @sale.product_id = s[:product] unless s[:product] == ""
      @sale.employee_id = s[:employee] unless s[:employee] == ""
      @sale.price = s[:price]
      @sale.price_commission = s[:price_commission]
      @sale.percentage = s[:percentage]
      @sale.plan = s[:plan]

      @sale.save

      respond_to do |f|
        f.html { redirect_to @sale, notice: 'Venda alterada'}
      end
    else
      respond_to do |f|
        f.html { render action: "edit", notice: 'Erro ao editar venda'}
      end
    end
    #respond_to do |format|
    #  if @sale.update_attributes(params[:sale])
    #   @sale.sold_on = filter_time(params[:sale], :sold_on)
    #    format.html { redirect_to @sale, notice: 'Venda alterada com sucesso.' }
    #    format.json { head :ok }
    #    @sale.save
    #  else
    #    format.html { render action: "edit" }
    #    format.json { render json: @sale.errors, status: :unprocessable_entity }
    #  end
    #end
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

  def export_sales
    @sales = Sale.all()
    sales_string = 'Nome;Produto;Data Compra;Data Ultima Troca;Telefone;Celular<br>'
    @sales.each do |s|
      sales_string += s.customer.name unless s.customer == nil
      sales_string += ';'
      sales_string += s.product.name unless s.product == nil
      sales_string += ';'
      sales_string += s.sold_on.to_s + ';'
      sales_string += s.last_change_on.to_s + ';'
      sales_string += s.customer.phone_number.to_s unless s.customer == nil
      sales_string += ';'
      sales_string += s.customer.mobile_phone.to_s unless s.customer == nil
      sales_string += '<br>'
    end

    respond_to do |format|
      format.html {render :text => sales_string}
    end

  end

end
