class ContextOpenClosesController < ApplicationController
  # GET /context_open_closes
  # GET /context_open_closes.json
  def index
    @context_open_closes = ContextOpenClose.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_open_closes }
    end
  end

  # GET /context_open_closes/1
  # GET /context_open_closes/1.json
  def show
    @context_open_close = ContextOpenClose.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_open_close }
    end
  end

  # GET /context_open_closes/new
  # GET /context_open_closes/new.json
  def new
    @context_open_close = ContextOpenClose.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_open_close }
    end
  end

  # GET /context_open_closes/1/edit
  def edit
    @context_open_close = ContextOpenClose.find(params[:id])
  end

  # POST /context_open_closes
  # POST /context_open_closes.json
  def create
    @context_open_close = ContextOpenClose.new(params[:context_open_close])

    respond_to do |format|
      if @context_open_close.save
        format.html { redirect_to @context_open_close, notice: 'Context open close was successfully created.' }
        format.json { render json: @context_open_close, status: :created, location: @context_open_close }
      else
        format.html { render action: "new" }
        format.json { render json: @context_open_close.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_open_closes/1
  # PUT /context_open_closes/1.json
  def update
    @context_open_close = ContextOpenClose.find(params[:id])

    respond_to do |format|
      if @context_open_close.update_attributes(params[:context_open_close])
        format.html { redirect_to @context_open_close, notice: 'Context open close was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_open_close.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_open_closes/1
  # DELETE /context_open_closes/1.json
  def destroy
    @context_open_close = ContextOpenClose.find(params[:id])
    @context_open_close.destroy

    respond_to do |format|
      format.html { redirect_to context_open_closes_url }
      format.json { head :no_content }
    end
  end
end
