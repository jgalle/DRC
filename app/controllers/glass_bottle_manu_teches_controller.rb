class GlassBottleManuTechesController < ApplicationController
  # GET /glass_bottle_manu_teches
  # GET /glass_bottle_manu_teches.json
  def index
    @glass_bottle_manu_teches = GlassBottleManuTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_bottle_manu_teches }
    end
  end

  # GET /glass_bottle_manu_teches/1
  # GET /glass_bottle_manu_teches/1.json
  def show
    @glass_bottle_manu_tech = GlassBottleManuTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_bottle_manu_tech }
    end
  end

  # GET /glass_bottle_manu_teches/new
  # GET /glass_bottle_manu_teches/new.json
  def new
    @glass_bottle_manu_tech = GlassBottleManuTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_bottle_manu_tech }
    end
  end

  # GET /glass_bottle_manu_teches/1/edit
  def edit
    @glass_bottle_manu_tech = GlassBottleManuTech.find(params[:id])
  end

  # POST /glass_bottle_manu_teches
  # POST /glass_bottle_manu_teches.json
  def create
    @glass_bottle_manu_tech = GlassBottleManuTech.new(params[:glass_bottle_manu_tech])

    respond_to do |format|
      if @glass_bottle_manu_tech.save
        format.html { redirect_to @glass_bottle_manu_tech, notice: 'Glass bottle manu tech was successfully created.' }
        format.json { render json: @glass_bottle_manu_tech, status: :created, location: @glass_bottle_manu_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_bottle_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_bottle_manu_teches/1
  # PUT /glass_bottle_manu_teches/1.json
  def update
    @glass_bottle_manu_tech = GlassBottleManuTech.find(params[:id])

    respond_to do |format|
      if @glass_bottle_manu_tech.update_attributes(params[:glass_bottle_manu_tech])
        format.html { redirect_to @glass_bottle_manu_tech, notice: 'Glass bottle manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_bottle_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_bottle_manu_teches/1
  # DELETE /glass_bottle_manu_teches/1.json
  def destroy
    @glass_bottle_manu_tech = GlassBottleManuTech.find(params[:id])
    @glass_bottle_manu_tech.destroy

    respond_to do |format|
      format.html { redirect_to glass_bottle_manu_teches_url }
      format.json { head :no_content }
    end
  end
end
