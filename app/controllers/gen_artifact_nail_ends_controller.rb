class GenArtifactNailEndsController < ApplicationController
  # GET /gen_artifact_nail_ends
  # GET /gen_artifact_nail_ends.json
  def index
    @gen_artifact_nail_ends = GenArtifactNailEnd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_nail_ends }
    end
  end

  # GET /gen_artifact_nail_ends/1
  # GET /gen_artifact_nail_ends/1.json
  def show
    @gen_artifact_nail_end = GenArtifactNailEnd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_nail_end }
    end
  end

  # GET /gen_artifact_nail_ends/new
  # GET /gen_artifact_nail_ends/new.json
  def new
    @gen_artifact_nail_end = GenArtifactNailEnd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_nail_end }
    end
  end

  # GET /gen_artifact_nail_ends/1/edit
  def edit
    @gen_artifact_nail_end = GenArtifactNailEnd.find(params[:id])
  end

  # POST /gen_artifact_nail_ends
  # POST /gen_artifact_nail_ends.json
  def create
    @gen_artifact_nail_end = GenArtifactNailEnd.new(params[:gen_artifact_nail_end])

    respond_to do |format|
      if @gen_artifact_nail_end.save
        format.html { redirect_to @gen_artifact_nail_end, notice: 'Gen artifact nail end was successfully created.' }
        format.json { render json: @gen_artifact_nail_end, status: :created, location: @gen_artifact_nail_end }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_nail_end.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_nail_ends/1
  # PUT /gen_artifact_nail_ends/1.json
  def update
    @gen_artifact_nail_end = GenArtifactNailEnd.find(params[:id])

    respond_to do |format|
      if @gen_artifact_nail_end.update_attributes(params[:gen_artifact_nail_end])
        format.html { redirect_to @gen_artifact_nail_end, notice: 'Gen artifact nail end was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_nail_end.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_nail_ends/1
  # DELETE /gen_artifact_nail_ends/1.json
  def destroy
    @gen_artifact_nail_end = GenArtifactNailEnd.find(params[:id])
    @gen_artifact_nail_end.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_nail_ends_url }
      format.json { head :no_content }
    end
  end
end
