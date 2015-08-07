class ButtonJewelInlayMaterialsController < ApplicationController
  # GET /button_jewel_inlay_materials
  # GET /button_jewel_inlay_materials.json
  def index
    @button_jewel_inlay_materials = ButtonJewelInlayMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_jewel_inlay_materials }
    end
  end

  # GET /button_jewel_inlay_materials/1
  # GET /button_jewel_inlay_materials/1.json
  def show
    @button_jewel_inlay_material = ButtonJewelInlayMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_jewel_inlay_material }
    end
  end

  # GET /button_jewel_inlay_materials/new
  # GET /button_jewel_inlay_materials/new.json
  def new
    @button_jewel_inlay_material = ButtonJewelInlayMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_jewel_inlay_material }
    end
  end

  # GET /button_jewel_inlay_materials/1/edit
  def edit
    @button_jewel_inlay_material = ButtonJewelInlayMaterial.find(params[:id])
  end

  # POST /button_jewel_inlay_materials
  # POST /button_jewel_inlay_materials.json
  def create
    @button_jewel_inlay_material = ButtonJewelInlayMaterial.new(params[:button_jewel_inlay_material])

    respond_to do |format|
      if @button_jewel_inlay_material.save
        format.html { redirect_to @button_jewel_inlay_material, notice: 'Button jewel inlay material was successfully created.' }
        format.json { render json: @button_jewel_inlay_material, status: :created, location: @button_jewel_inlay_material }
      else
        format.html { render action: "new" }
        format.json { render json: @button_jewel_inlay_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_jewel_inlay_materials/1
  # PUT /button_jewel_inlay_materials/1.json
  def update
    @button_jewel_inlay_material = ButtonJewelInlayMaterial.find(params[:id])

    respond_to do |format|
      if @button_jewel_inlay_material.update_attributes(params[:button_jewel_inlay_material])
        format.html { redirect_to @button_jewel_inlay_material, notice: 'Button jewel inlay material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_jewel_inlay_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_jewel_inlay_materials/1
  # DELETE /button_jewel_inlay_materials/1.json
  def destroy
    @button_jewel_inlay_material = ButtonJewelInlayMaterial.find(params[:id])
    @button_jewel_inlay_material.destroy

    respond_to do |format|
      format.html { redirect_to button_jewel_inlay_materials_url }
      format.json { head :no_content }
    end
  end
end
