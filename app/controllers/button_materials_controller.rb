class ButtonMaterialsController < ApplicationController
  # GET /button_materials
  # GET /button_materials.json
  def index
    @button_materials = ButtonMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_materials }
    end
  end

  # GET /button_materials/1
  # GET /button_materials/1.json
  def show
    @button_material = ButtonMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_material }
    end
  end

  # GET /button_materials/new
  # GET /button_materials/new.json
  def new
    @button_material = ButtonMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_material }
    end
  end

  # GET /button_materials/1/edit
  def edit
    @button_material = ButtonMaterial.find(params[:id])
  end

  # POST /button_materials
  # POST /button_materials.json
  def create
    @button_material = ButtonMaterial.new(params[:button_material])

    respond_to do |format|
      if @button_material.save
        format.html { redirect_to @button_material, notice: 'Button material was successfully created.' }
        format.json { render json: @button_material, status: :created, location: @button_material }
      else
        format.html { render action: "new" }
        format.json { render json: @button_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_materials/1
  # PUT /button_materials/1.json
  def update
    @button_material = ButtonMaterial.find(params[:id])

    respond_to do |format|
      if @button_material.update_attributes(params[:button_material])
        format.html { redirect_to @button_material, notice: 'Button material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_materials/1
  # DELETE /button_materials/1.json
  def destroy
    @button_material = ButtonMaterial.find(params[:id])
    @button_material.destroy

    respond_to do |format|
      format.html { redirect_to button_materials_url }
      format.json { head :no_content }
    end
  end
end
