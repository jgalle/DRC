class GlassBottlesController < ApplicationController
  # GET /glass_bottles
  # GET /glass_bottles.json
  def index
    @glass_bottles = GlassBottle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_bottles }
    end
  end

  # GET /glass_bottles/1
  # GET /glass_bottles/1.json
  def show
    @glass_bottle = GlassBottle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_bottle }
    end
  end

  # GET /glass_bottles/new
  # GET /glass_bottles/new.json
  def new
    @glass_bottle = GlassBottle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_bottle }
    end
  end

  # GET /glass_bottles/1/edit
  def edit
    @glass_bottle = GlassBottle.find(params[:id])
  end

  # POST /glass_bottles
  # POST /glass_bottles.json
  def create
    @glass_bottle = GlassBottle.new(params[:glass_bottle])

    respond_to do |format|
      if @glass_bottle.save
        format.html { redirect_to @glass_bottle, notice: 'Glass bottle was successfully created.' }
        format.json { render json: @glass_bottle, status: :created, location: @glass_bottle }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_bottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_bottles/1
  # PUT /glass_bottles/1.json
  def update
    @glass_bottle = GlassBottle.find(params[:id])

    respond_to do |format|
      if @glass_bottle.update_attributes(params[:glass_bottle])
        format.html { redirect_to @glass_bottle, notice: 'Glass bottle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_bottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_bottles/1
  # DELETE /glass_bottles/1.json
  def destroy
    @glass_bottle = GlassBottle.find(params[:id])
    @glass_bottle.destroy

    respond_to do |format|
      format.html { redirect_to glass_bottles_url }
      format.json { head :no_content }
    end
  end
end
