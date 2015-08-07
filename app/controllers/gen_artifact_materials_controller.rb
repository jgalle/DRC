class GenArtifactMaterialsController < ApplicationController
  # GET /gen_artifact_materials
  # GET /gen_artifact_materials.json
  def index
    @gen_artifact_materials = GenArtifactMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_materials }
    end
  end

  # GET /gen_artifact_materials/1
  # GET /gen_artifact_materials/1.json
  def show
    @gen_artifact_material = GenArtifactMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_material }
    end
  end

  # GET /gen_artifact_materials/new
  # GET /gen_artifact_materials/new.json
  def new
    @gen_artifact_material = GenArtifactMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_material }
    end
  end

  # GET /gen_artifact_materials/1/edit
  def edit
    @gen_artifact_material = GenArtifactMaterial.find(params[:id])
  end

  # POST /gen_artifact_materials
  # POST /gen_artifact_materials.json
  def create
    @gen_artifact_material = GenArtifactMaterial.new(params[:gen_artifact_material])

    respond_to do |format|
      if @gen_artifact_material.save
        format.html { redirect_to @gen_artifact_material, notice: 'Gen artifact material was successfully created.' }
        format.json { render json: @gen_artifact_material, status: :created, location: @gen_artifact_material }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_materials/1
  # PUT /gen_artifact_materials/1.json
  def update
    @gen_artifact_material = GenArtifactMaterial.find(params[:id])

    respond_to do |format|
      if @gen_artifact_material.update_attributes(params[:gen_artifact_material])
        format.html { redirect_to @gen_artifact_material, notice: 'Gen artifact material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_materials/1
  # DELETE /gen_artifact_materials/1.json
  def destroy
    @gen_artifact_material = GenArtifactMaterial.find(params[:id])
    @gen_artifact_material.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_materials_url }
      format.json { head :no_content }
    end
  end
end
