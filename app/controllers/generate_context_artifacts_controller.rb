class GenerateContextArtifactsController < ApplicationController
  # GET /generate_context_artifacts
  # GET /generate_context_artifacts.json
  def index
    @generate_context_artifacts = GenerateContextArtifact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @generate_context_artifacts }
    end
  end

  # GET /generate_context_artifacts/1
  # GET /generate_context_artifacts/1.json
  def show
    @generate_context_artifact = GenerateContextArtifact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @generate_context_artifact }
    end
  end

  # GET /generate_context_artifacts/new
  # GET /generate_context_artifacts/new.json
  def new
    @generate_context_artifact = GenerateContextArtifact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @generate_context_artifact }
    end
  end

  # GET /generate_context_artifacts/1/edit
  def edit
    @generate_context_artifact = GenerateContextArtifact.find(params[:id])
  end

  # POST /generate_context_artifacts
  # POST /generate_context_artifacts.json
  def create
    @generate_context_artifact = GenerateContextArtifact.new(params[:generate_context_artifact])

    respond_to do |format|
      if @generate_context_artifact.save
        format.html { redirect_to @generate_context_artifact, notice: 'Generate context artifact was successfully created.' }
        format.json { render json: @generate_context_artifact, status: :created, location: @generate_context_artifact }
      else
        format.html { render action: "new" }
        format.json { render json: @generate_context_artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /generate_context_artifacts/1
  # PUT /generate_context_artifacts/1.json
  def update
    @generate_context_artifact = GenerateContextArtifact.find(params[:id])

    respond_to do |format|
      if @generate_context_artifact.update_attributes(params[:generate_context_artifact])
        format.html { redirect_to @generate_context_artifact, notice: 'Generate context artifact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @generate_context_artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generate_context_artifacts/1
  # DELETE /generate_context_artifacts/1.json
  def destroy
    @generate_context_artifact = GenerateContextArtifact.find(params[:id])
    @generate_context_artifact.destroy

    respond_to do |format|
      format.html { redirect_to generate_context_artifacts_url }
      format.json { head :no_content }
    end
  end
end
