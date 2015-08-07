class GenArtifactNailModificationsController < ApplicationController
  # GET /gen_artifact_nail_modifications
  # GET /gen_artifact_nail_modifications.json
  def index
    @gen_artifact_nail_modifications = GenArtifactNailModification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_nail_modifications }
    end
  end

  # GET /gen_artifact_nail_modifications/1
  # GET /gen_artifact_nail_modifications/1.json
  def show
    @gen_artifact_nail_modification = GenArtifactNailModification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_nail_modification }
    end
  end

  # GET /gen_artifact_nail_modifications/new
  # GET /gen_artifact_nail_modifications/new.json
  def new
    @gen_artifact_nail_modification = GenArtifactNailModification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_nail_modification }
    end
  end

  # GET /gen_artifact_nail_modifications/1/edit
  def edit
    @gen_artifact_nail_modification = GenArtifactNailModification.find(params[:id])
  end

  # POST /gen_artifact_nail_modifications
  # POST /gen_artifact_nail_modifications.json
  def create
    @gen_artifact_nail_modification = GenArtifactNailModification.new(params[:gen_artifact_nail_modification])

    respond_to do |format|
      if @gen_artifact_nail_modification.save
        format.html { redirect_to @gen_artifact_nail_modification, notice: 'Gen artifact nail modification was successfully created.' }
        format.json { render json: @gen_artifact_nail_modification, status: :created, location: @gen_artifact_nail_modification }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_nail_modification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_nail_modifications/1
  # PUT /gen_artifact_nail_modifications/1.json
  def update
    @gen_artifact_nail_modification = GenArtifactNailModification.find(params[:id])

    respond_to do |format|
      if @gen_artifact_nail_modification.update_attributes(params[:gen_artifact_nail_modification])
        format.html { redirect_to @gen_artifact_nail_modification, notice: 'Gen artifact nail modification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_nail_modification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_nail_modifications/1
  # DELETE /gen_artifact_nail_modifications/1.json
  def destroy
    @gen_artifact_nail_modification = GenArtifactNailModification.find(params[:id])
    @gen_artifact_nail_modification.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_nail_modifications_url }
      format.json { head :no_content }
    end
  end
end
