class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.where(name: /^#{params[:term]}/i)
    list = @customers.map {|c| Hash[ id: c.id, label: c.name ]}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: list }
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])
    @customer.date_of_birth = filter_time(params[:customer], :date_of_birth)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Cliente cadastrado com sucesso.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        @customer.date_of_birth = filter_time(params[:customer], :date_of_birth)
        format.html { redirect_to @customer, notice: 'Cliente alterado com sucesso.' }
        format.json { head :ok }
        @customer.save
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :ok }
    end
  end
end
