class GenObjectArtifactsController < ApplicationController
  # GET /gen_object_artifacts
  # GET /gen_object_artifacts.json
  def index
    @gen_object_artifacts = GenObjectArtifact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_artifacts }
    end
  end

  # GET /gen_object_artifacts/1
  # GET /gen_object_artifacts/1.json
  def show
    @gen_object_artifact = GenObjectArtifact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_artifact }
    end
  end

  # GET /gen_object_artifacts/new
  # GET /gen_object_artifacts/new.json
  def new
    @gen_object_artifact = GenObjectArtifact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_artifact }
    end
  end

  # GET /gen_object_artifacts/1/edit
  def edit
    @gen_object_artifact = GenObjectArtifact.find(params[:id])
  end

  # POST /gen_object_artifacts
  # POST /gen_object_artifacts.json
  def create
    @gen_object_artifact = GenObjectArtifact.new(params[:gen_object_artifact])

    respond_to do |format|
      if @gen_object_artifact.save
        format.html { redirect_to @gen_object_artifact, notice: 'Gen object artifact was successfully created.' }
        format.json { render json: @gen_object_artifact, status: :created, location: @gen_object_artifact }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_artifacts/1
  # PUT /gen_object_artifacts/1.json
  def update
    @gen_object_artifact = GenObjectArtifact.find(params[:id])

    respond_to do |format|
      if @gen_object_artifact.update_attributes(params[:gen_object_artifact])
        format.html { redirect_to @gen_object_artifact, notice: 'Gen object artifact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_artifacts/1
  # DELETE /gen_object_artifacts/1.json
  def destroy
    @gen_object_artifact = GenObjectArtifact.find(params[:id])
    @gen_object_artifact.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_artifacts_url }
      format.json { head :no_content }
    end
  end
end
