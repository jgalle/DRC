class CeramicManuTechesController < ApplicationController
  # GET /ceramic_manu_teches
  # GET /ceramic_manu_teches.json
  def index
    @ceramic_manu_teches = CeramicManuTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_manu_teches }
    end
  end

  # GET /ceramic_manu_teches/1
  # GET /ceramic_manu_teches/1.json
  def show
    @ceramic_manu_tech = CeramicManuTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_manu_tech }
    end
  end

  # GET /ceramic_manu_teches/new
  # GET /ceramic_manu_teches/new.json
  def new
    @ceramic_manu_tech = CeramicManuTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_manu_tech }
    end
  end

  # GET /ceramic_manu_teches/1/edit
  def edit
    @ceramic_manu_tech = CeramicManuTech.find(params[:id])
  end

  # POST /ceramic_manu_teches
  # POST /ceramic_manu_teches.json
  def create
    @ceramic_manu_tech = CeramicManuTech.new(params[:ceramic_manu_tech])

    respond_to do |format|
      if @ceramic_manu_tech.save
        format.html { redirect_to @ceramic_manu_tech, notice: 'Ceramic manu tech was successfully created.' }
        format.json { render json: @ceramic_manu_tech, status: :created, location: @ceramic_manu_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_manu_teches/1
  # PUT /ceramic_manu_teches/1.json
  def update
    @ceramic_manu_tech = CeramicManuTech.find(params[:id])

    respond_to do |format|
      if @ceramic_manu_tech.update_attributes(params[:ceramic_manu_tech])
        format.html { redirect_to @ceramic_manu_tech, notice: 'Ceramic manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_manu_teches/1
  # DELETE /ceramic_manu_teches/1.json
  def destroy
    @ceramic_manu_tech = CeramicManuTech.find(params[:id])
    @ceramic_manu_tech.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_manu_teches_url }
      format.json { head :no_content }
    end
  end
end
