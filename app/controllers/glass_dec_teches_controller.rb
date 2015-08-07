class GlassDecTechesController < ApplicationController
  # GET /glass_dec_teches
  # GET /glass_dec_teches.json
  def index
    @glass_dec_teches = GlassDecTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_dec_teches }
    end
  end

  # GET /glass_dec_teches/1
  # GET /glass_dec_teches/1.json
  def show
    @glass_dec_tech = GlassDecTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_dec_tech }
    end
  end

  # GET /glass_dec_teches/new
  # GET /glass_dec_teches/new.json
  def new
    @glass_dec_tech = GlassDecTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_dec_tech }
    end
  end

  # GET /glass_dec_teches/1/edit
  def edit
    @glass_dec_tech = GlassDecTech.find(params[:id])
  end

  # POST /glass_dec_teches
  # POST /glass_dec_teches.json
  def create
    @glass_dec_tech = GlassDecTech.new(params[:glass_dec_tech])

    respond_to do |format|
      if @glass_dec_tech.save
        format.html { redirect_to @glass_dec_tech, notice: 'Glass dec tech was successfully created.' }
        format.json { render json: @glass_dec_tech, status: :created, location: @glass_dec_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_dec_teches/1
  # PUT /glass_dec_teches/1.json
  def update
    @glass_dec_tech = GlassDecTech.find(params[:id])

    respond_to do |format|
      if @glass_dec_tech.update_attributes(params[:glass_dec_tech])
        format.html { redirect_to @glass_dec_tech, notice: 'Glass dec tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_dec_teches/1
  # DELETE /glass_dec_teches/1.json
  def destroy
    @glass_dec_tech = GlassDecTech.find(params[:id])
    @glass_dec_tech.destroy

    respond_to do |format|
      format.html { redirect_to glass_dec_teches_url }
      format.json { head :no_content }
    end
  end
end
