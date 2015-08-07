class BuckleMaterialsController < ApplicationController
  # GET /buckle_materials
  # GET /buckle_materials.json
  def index
    @buckle_materials = BuckleMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_materials }
    end
  end

  # GET /buckle_materials/1
  # GET /buckle_materials/1.json
  def show
    @buckle_material = BuckleMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_material }
    end
  end

  # GET /buckle_materials/new
  # GET /buckle_materials/new.json
  def new
    @buckle_material = BuckleMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_material }
    end
  end

  # GET /buckle_materials/1/edit
  def edit
    @buckle_material = BuckleMaterial.find(params[:id])
  end

  # POST /buckle_materials
  # POST /buckle_materials.json
  def create
    @buckle_material = BuckleMaterial.new(params[:buckle_material])

    respond_to do |format|
      if @buckle_material.save
        format.html { redirect_to @buckle_material, notice: 'Buckle material was successfully created.' }
        format.json { render json: @buckle_material, status: :created, location: @buckle_material }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_materials/1
  # PUT /buckle_materials/1.json
  def update
    @buckle_material = BuckleMaterial.find(params[:id])

    respond_to do |format|
      if @buckle_material.update_attributes(params[:buckle_material])
        format.html { redirect_to @buckle_material, notice: 'Buckle material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_materials/1
  # DELETE /buckle_materials/1.json
  def destroy
    @buckle_material = BuckleMaterial.find(params[:id])
    @buckle_material.destroy

    respond_to do |format|
      format.html { redirect_to buckle_materials_url }
      format.json { head :no_content }
    end
  end
end
