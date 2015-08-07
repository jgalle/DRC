class UtensilMaterialsController < ApplicationController
  # GET /utensil_materials
  # GET /utensil_materials.json
  def index
    @utensil_materials = UtensilMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensil_materials }
    end
  end

  # GET /utensil_materials/1
  # GET /utensil_materials/1.json
  def show
    @utensil_material = UtensilMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil_material }
    end
  end

  # GET /utensil_materials/new
  # GET /utensil_materials/new.json
  def new
    @utensil_material = UtensilMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utensil_material }
    end
  end

  # GET /utensil_materials/1/edit
  def edit
    @utensil_material = UtensilMaterial.find(params[:id])
  end

  # POST /utensil_materials
  # POST /utensil_materials.json
  def create
    @utensil_material = UtensilMaterial.new(params[:utensil_material])

    respond_to do |format|
      if @utensil_material.save
        format.html { redirect_to @utensil_material, notice: 'Utensil material was successfully created.' }
        format.json { render json: @utensil_material, status: :created, location: @utensil_material }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensil_materials/1
  # PUT /utensil_materials/1.json
  def update
    @utensil_material = UtensilMaterial.find(params[:id])

    respond_to do |format|
      if @utensil_material.update_attributes(params[:utensil_material])
        format.html { redirect_to @utensil_material, notice: 'Utensil material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensil_materials/1
  # DELETE /utensil_materials/1.json
  def destroy
    @utensil_material = UtensilMaterial.find(params[:id])
    @utensil_material.destroy

    respond_to do |format|
      format.html { redirect_to utensil_materials_url }
      format.json { head :no_content }
    end
  end
end
