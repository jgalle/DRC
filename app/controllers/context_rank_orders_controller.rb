class ContextRankOrdersController < ApplicationController
  # GET /context_rank_orders
  # GET /context_rank_orders.json
  def index
    @context_rank_orders = ContextRankOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_rank_orders }
    end
  end

  # GET /context_rank_orders/1
  # GET /context_rank_orders/1.json
  def show
    @context_rank_order = ContextRankOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_rank_order }
    end
  end

  # GET /context_rank_orders/new
  # GET /context_rank_orders/new.json
  def new
    @context_rank_order = ContextRankOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_rank_order }
    end
  end

  # GET /context_rank_orders/1/edit
  def edit
    @context_rank_order = ContextRankOrder.find(params[:id])
  end

  # POST /context_rank_orders
  # POST /context_rank_orders.json
  def create
    @context_rank_order = ContextRankOrder.new(params[:context_rank_order])

    respond_to do |format|
      if @context_rank_order.save
        format.html { redirect_to @context_rank_order, notice: 'Context rank order was successfully created.' }
        format.json { render json: @context_rank_order, status: :created, location: @context_rank_order }
      else
        format.html { render action: "new" }
        format.json { render json: @context_rank_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_rank_orders/1
  # PUT /context_rank_orders/1.json
  def update
    @context_rank_order = ContextRankOrder.find(params[:id])

    respond_to do |format|
      if @context_rank_order.update_attributes(params[:context_rank_order])
        format.html { redirect_to @context_rank_order, notice: 'Context rank order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_rank_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_rank_orders/1
  # DELETE /context_rank_orders/1.json
  def destroy
    @context_rank_order = ContextRankOrder.find(params[:id])
    @context_rank_order.destroy

    respond_to do |format|
      format.html { redirect_to context_rank_orders_url }
      format.json { head :no_content }
    end
  end
end
