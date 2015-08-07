class GenArtifactDecTechTypesController < ApplicationController
  # GET /gen_artifact_dec_tech_types
  # GET /gen_artifact_dec_tech_types.json
  def index
    @gen_artifact_dec_tech_types = GenArtifactDecTechType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_dec_tech_types }
    end
  end

  # GET /gen_artifact_dec_tech_types/1
  # GET /gen_artifact_dec_tech_types/1.json
  def show
    @gen_artifact_dec_tech_type = GenArtifactDecTechType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_dec_tech_type }
    end
  end

  # GET /gen_artifact_dec_tech_types/new
  # GET /gen_artifact_dec_tech_types/new.json
  def new
    @gen_artifact_dec_tech_type = GenArtifactDecTechType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_dec_tech_type }
    end
  end

  # GET /gen_artifact_dec_tech_types/1/edit
  def edit
    @gen_artifact_dec_tech_type = GenArtifactDecTechType.find(params[:id])
  end

  # POST /gen_artifact_dec_tech_types
  # POST /gen_artifact_dec_tech_types.json
  def create
    @gen_artifact_dec_tech_type = GenArtifactDecTechType.new(params[:gen_artifact_dec_tech_type])

    respond_to do |format|
      if @gen_artifact_dec_tech_type.save
        format.html { redirect_to @gen_artifact_dec_tech_type, notice: 'Gen artifact dec tech type was successfully created.' }
        format.json { render json: @gen_artifact_dec_tech_type, status: :created, location: @gen_artifact_dec_tech_type }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_dec_tech_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_dec_tech_types/1
  # PUT /gen_artifact_dec_tech_types/1.json
  def update
    @gen_artifact_dec_tech_type = GenArtifactDecTechType.find(params[:id])

    respond_to do |format|
      if @gen_artifact_dec_tech_type.update_attributes(params[:gen_artifact_dec_tech_type])
        format.html { redirect_to @gen_artifact_dec_tech_type, notice: 'Gen artifact dec tech type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_dec_tech_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_dec_tech_types/1
  # DELETE /gen_artifact_dec_tech_types/1.json
  def destroy
    @gen_artifact_dec_tech_type = GenArtifactDecTechType.find(params[:id])
    @gen_artifact_dec_tech_type.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_dec_tech_types_url }
      format.json { head :no_content }
    end
  end
end
