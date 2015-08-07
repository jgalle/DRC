class GlassManuTechesController < ApplicationController
  # GET /glass_manu_teches
  # GET /glass_manu_teches.json
  def index
    @glass_manu_teches = GlassManuTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_manu_teches }
    end
  end

  # GET /glass_manu_teches/1
  # GET /glass_manu_teches/1.json
  def show
    @glass_manu_tech = GlassManuTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_manu_tech }
    end
  end

  # GET /glass_manu_teches/new
  # GET /glass_manu_teches/new.json
  def new
    @glass_manu_tech = GlassManuTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_manu_tech }
    end
  end

  # GET /glass_manu_teches/1/edit
  def edit
    @glass_manu_tech = GlassManuTech.find(params[:id])
  end

  # POST /glass_manu_teches
  # POST /glass_manu_teches.json
  def create
    @glass_manu_tech = GlassManuTech.new(params[:glass_manu_tech])

    respond_to do |format|
      if @glass_manu_tech.save
        format.html { redirect_to @glass_manu_tech, notice: 'Glass manu tech was successfully created.' }
        format.json { render json: @glass_manu_tech, status: :created, location: @glass_manu_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_manu_teches/1
  # PUT /glass_manu_teches/1.json
  def update
    @glass_manu_tech = GlassManuTech.find(params[:id])

    respond_to do |format|
      if @glass_manu_tech.update_attributes(params[:glass_manu_tech])
        format.html { redirect_to @glass_manu_tech, notice: 'Glass manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_manu_teches/1
  # DELETE /glass_manu_teches/1.json
  def destroy
    @glass_manu_tech = GlassManuTech.find(params[:id])
    @glass_manu_tech.destroy

    respond_to do |format|
      format.html { redirect_to glass_manu_teches_url }
      format.json { head :no_content }
    end
  end
end
