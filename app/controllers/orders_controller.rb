class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.limit(200).order('created_at DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
      format.xml { }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end

  def to_svg()
    begin
      pj = Order.where('done = ?', 0).last.project
    rescue
      flash[:notice] = 'SVG作成済みです'
      redirect_to action: :index and return
    end
    @orders = Order.where('done = ? and project_id = ?', 0, pj.id).first(pj.num)
    p @orders.size
    str = pj.to_s_svg(@orders)
    lot = pj.lot
    Order.done(@orders, lot)
    send_data(str, :type =>'image/svg+xml', :filename => "#{lot}.svg")
    return
  end

  def import_tsv
    p 'hoge'
    pj_id = params[:project]
    lines =  params[:tsv].split("\r\n")
    lines.each do |line|
      row = line.split("\t")
      p row.size
      if(row.size >= 4 )
        r = Order.new
        r.fontset = Fontset.find_by_name(row[0])
        r.l1 = row[1]
        r.l2 = row[2]
        r.l3 = row[3]
        r.project_id = pj_id
        r.save
      end
    end
    redirect_to(:action => :index)

  end
end
