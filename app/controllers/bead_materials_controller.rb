class BeadMaterialsController < ApplicationController
  # GET /bead_materials
  # GET /bead_materials.json
  def index
    @bead_materials = BeadMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_materials }
    end
  end

  # GET /bead_materials/1
  # GET /bead_materials/1.json
  def show
    @bead_material = BeadMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_material }
    end
  end

  # GET /bead_materials/new
  # GET /bead_materials/new.json
  def new
    @bead_material = BeadMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_material }
    end
  end

  # GET /bead_materials/1/edit
  def edit
    @bead_material = BeadMaterial.find(params[:id])
  end

  # POST /bead_materials
  # POST /bead_materials.json
  def create
    @bead_material = BeadMaterial.new(params[:bead_material])

    respond_to do |format|
      if @bead_material.save
        format.html { redirect_to @bead_material, notice: 'Bead material was successfully created.' }
        format.json { render json: @bead_material, status: :created, location: @bead_material }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_materials/1
  # PUT /bead_materials/1.json
  def update
    @bead_material = BeadMaterial.find(params[:id])

    respond_to do |format|
      if @bead_material.update_attributes(params[:bead_material])
        format.html { redirect_to @bead_material, notice: 'Bead material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_materials/1
  # DELETE /bead_materials/1.json
  def destroy
    @bead_material = BeadMaterial.find(params[:id])
    @bead_material.destroy

    respond_to do |format|
      format.html { redirect_to bead_materials_url }
      format.json { head :no_content }
    end
  end
end
