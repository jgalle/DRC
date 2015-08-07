class ButtonShankMaterialsController < ApplicationController
  # GET /button_shank_materials
  # GET /button_shank_materials.json
  def index
    @button_shank_materials = ButtonShankMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_shank_materials }
    end
  end

  # GET /button_shank_materials/1
  # GET /button_shank_materials/1.json
  def show
    @button_shank_material = ButtonShankMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_shank_material }
    end
  end

  # GET /button_shank_materials/new
  # GET /button_shank_materials/new.json
  def new
    @button_shank_material = ButtonShankMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_shank_material }
    end
  end

  # GET /button_shank_materials/1/edit
  def edit
    @button_shank_material = ButtonShankMaterial.find(params[:id])
  end

  # POST /button_shank_materials
  # POST /button_shank_materials.json
  def create
    @button_shank_material = ButtonShankMaterial.new(params[:button_shank_material])

    respond_to do |format|
      if @button_shank_material.save
        format.html { redirect_to @button_shank_material, notice: 'Button shank material was successfully created.' }
        format.json { render json: @button_shank_material, status: :created, location: @button_shank_material }
      else
        format.html { render action: "new" }
        format.json { render json: @button_shank_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_shank_materials/1
  # PUT /button_shank_materials/1.json
  def update
    @button_shank_material = ButtonShankMaterial.find(params[:id])

    respond_to do |format|
      if @button_shank_material.update_attributes(params[:button_shank_material])
        format.html { redirect_to @button_shank_material, notice: 'Button shank material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_shank_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_shank_materials/1
  # DELETE /button_shank_materials/1.json
  def destroy
    @button_shank_material = ButtonShankMaterial.find(params[:id])
    @button_shank_material.destroy

    respond_to do |format|
      format.html { redirect_to button_shank_materials_url }
      format.json { head :no_content }
    end
  end
end
