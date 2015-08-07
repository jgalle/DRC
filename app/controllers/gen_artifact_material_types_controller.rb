class GenArtifactMaterialTypesController < ApplicationController
  # GET /gen_artifact_material_types
  # GET /gen_artifact_material_types.json
  def index
    @gen_artifact_material_types = GenArtifactMaterialType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_material_types }
    end
  end

  # GET /gen_artifact_material_types/1
  # GET /gen_artifact_material_types/1.json
  def show
    @gen_artifact_material_type = GenArtifactMaterialType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_material_type }
    end
  end

  # GET /gen_artifact_material_types/new
  # GET /gen_artifact_material_types/new.json
  def new
    @gen_artifact_material_type = GenArtifactMaterialType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_material_type }
    end
  end

  # GET /gen_artifact_material_types/1/edit
  def edit
    @gen_artifact_material_type = GenArtifactMaterialType.find(params[:id])
  end

  # POST /gen_artifact_material_types
  # POST /gen_artifact_material_types.json
  def create
    @gen_artifact_material_type = GenArtifactMaterialType.new(params[:gen_artifact_material_type])

    respond_to do |format|
      if @gen_artifact_material_type.save
        format.html { redirect_to @gen_artifact_material_type, notice: 'Gen artifact material type was successfully created.' }
        format.json { render json: @gen_artifact_material_type, status: :created, location: @gen_artifact_material_type }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_material_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_material_types/1
  # PUT /gen_artifact_material_types/1.json
  def update
    @gen_artifact_material_type = GenArtifactMaterialType.find(params[:id])

    respond_to do |format|
      if @gen_artifact_material_type.update_attributes(params[:gen_artifact_material_type])
        format.html { redirect_to @gen_artifact_material_type, notice: 'Gen artifact material type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_material_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_material_types/1
  # DELETE /gen_artifact_material_types/1.json
  def destroy
    @gen_artifact_material_type = GenArtifactMaterialType.find(params[:id])
    @gen_artifact_material_type.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_material_types_url }
      format.json { head :no_content }
    end
  end
end
