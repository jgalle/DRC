class GlassMaterialsController < ApplicationController
  # GET /glass_materials
  # GET /glass_materials.json
  def index
    @glass_materials = GlassMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_materials }
    end
  end

  # GET /glass_materials/1
  # GET /glass_materials/1.json
  def show
    @glass_material = GlassMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_material }
    end
  end

  # GET /glass_materials/new
  # GET /glass_materials/new.json
  def new
    @glass_material = GlassMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_material }
    end
  end

  # GET /glass_materials/1/edit
  def edit
    @glass_material = GlassMaterial.find(params[:id])
  end

  # POST /glass_materials
  # POST /glass_materials.json
  def create
    @glass_material = GlassMaterial.new(params[:glass_material])

    respond_to do |format|
      if @glass_material.save
        format.html { redirect_to @glass_material, notice: 'Glass material was successfully created.' }
        format.json { render json: @glass_material, status: :created, location: @glass_material }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_materials/1
  # PUT /glass_materials/1.json
  def update
    @glass_material = GlassMaterial.find(params[:id])

    respond_to do |format|
      if @glass_material.update_attributes(params[:glass_material])
        format.html { redirect_to @glass_material, notice: 'Glass material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_materials/1
  # DELETE /glass_materials/1.json
  def destroy
    @glass_material = GlassMaterial.find(params[:id])
    @glass_material.destroy

    respond_to do |format|
      format.html { redirect_to glass_materials_url }
      format.json { head :no_content }
    end
  end
end
