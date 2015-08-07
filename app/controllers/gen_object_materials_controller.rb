class GenObjectMaterialsController < ApplicationController
  # GET /gen_object_materials
  # GET /gen_object_materials.json
  def index
    @gen_object_materials = GenObjectMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_materials }
    end
  end

  # GET /gen_object_materials/1
  # GET /gen_object_materials/1.json
  def show
    @gen_object_material = GenObjectMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_material }
    end
  end

  # GET /gen_object_materials/new
  # GET /gen_object_materials/new.json
  def new
    @gen_object_material = GenObjectMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_material }
    end
  end

  # GET /gen_object_materials/1/edit
  def edit
    @gen_object_material = GenObjectMaterial.find(params[:id])
  end

  # POST /gen_object_materials
  # POST /gen_object_materials.json
  def create
    @gen_object_material = GenObjectMaterial.new(params[:gen_object_material])

    respond_to do |format|
      if @gen_object_material.save
        format.html { redirect_to @gen_object_material, notice: 'Gen object material was successfully created.' }
        format.json { render json: @gen_object_material, status: :created, location: @gen_object_material }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_materials/1
  # PUT /gen_object_materials/1.json
  def update
    @gen_object_material = GenObjectMaterial.find(params[:id])

    respond_to do |format|
      if @gen_object_material.update_attributes(params[:gen_object_material])
        format.html { redirect_to @gen_object_material, notice: 'Gen object material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_materials/1
  # DELETE /gen_object_materials/1.json
  def destroy
    @gen_object_material = GenObjectMaterial.find(params[:id])
    @gen_object_material.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_materials_url }
      format.json { head :no_content }
    end
  end
end
