class CeramicMaterialsController < ApplicationController
  # GET /ceramic_materials
  # GET /ceramic_materials.json
  def index
    @ceramic_materials = CeramicMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_materials }
    end
  end

  # GET /ceramic_materials/1
  # GET /ceramic_materials/1.json
  def show
    @ceramic_material = CeramicMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_material }
    end
  end

  # GET /ceramic_materials/new
  # GET /ceramic_materials/new.json
  def new
    @ceramic_material = CeramicMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_material }
    end
  end

  # GET /ceramic_materials/1/edit
  def edit
    @ceramic_material = CeramicMaterial.find(params[:id])
  end

  # POST /ceramic_materials
  # POST /ceramic_materials.json
  def create
    @ceramic_material = CeramicMaterial.new(params[:ceramic_material])

    respond_to do |format|
      if @ceramic_material.save
        format.html { redirect_to @ceramic_material, notice: 'Ceramic material was successfully created.' }
        format.json { render json: @ceramic_material, status: :created, location: @ceramic_material }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_materials/1
  # PUT /ceramic_materials/1.json
  def update
    @ceramic_material = CeramicMaterial.find(params[:id])

    respond_to do |format|
      if @ceramic_material.update_attributes(params[:ceramic_material])
        format.html { redirect_to @ceramic_material, notice: 'Ceramic material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_materials/1
  # DELETE /ceramic_materials/1.json
  def destroy
    @ceramic_material = CeramicMaterial.find(params[:id])
    @ceramic_material.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_materials_url }
      format.json { head :no_content }
    end
  end
end
