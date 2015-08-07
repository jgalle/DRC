class GenArtifactDecTechesController < ApplicationController
  # GET /gen_artifact_dec_teches
  # GET /gen_artifact_dec_teches.json
  def index
    @gen_artifact_dec_teches = GenArtifactDecTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_dec_teches }
    end
  end

  # GET /gen_artifact_dec_teches/1
  # GET /gen_artifact_dec_teches/1.json
  def show
    @gen_artifact_dec_tech = GenArtifactDecTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_dec_tech }
    end
  end

  # GET /gen_artifact_dec_teches/new
  # GET /gen_artifact_dec_teches/new.json
  def new
    @gen_artifact_dec_tech = GenArtifactDecTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_dec_tech }
    end
  end

  # GET /gen_artifact_dec_teches/1/edit
  def edit
    @gen_artifact_dec_tech = GenArtifactDecTech.find(params[:id])
  end

  # POST /gen_artifact_dec_teches
  # POST /gen_artifact_dec_teches.json
  def create
    @gen_artifact_dec_tech = GenArtifactDecTech.new(params[:gen_artifact_dec_tech])

    respond_to do |format|
      if @gen_artifact_dec_tech.save
        format.html { redirect_to @gen_artifact_dec_tech, notice: 'Gen artifact dec tech was successfully created.' }
        format.json { render json: @gen_artifact_dec_tech, status: :created, location: @gen_artifact_dec_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_dec_teches/1
  # PUT /gen_artifact_dec_teches/1.json
  def update
    @gen_artifact_dec_tech = GenArtifactDecTech.find(params[:id])

    respond_to do |format|
      if @gen_artifact_dec_tech.update_attributes(params[:gen_artifact_dec_tech])
        format.html { redirect_to @gen_artifact_dec_tech, notice: 'Gen artifact dec tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_dec_teches/1
  # DELETE /gen_artifact_dec_teches/1.json
  def destroy
    @gen_artifact_dec_tech = GenArtifactDecTech.find(params[:id])
    @gen_artifact_dec_tech.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_dec_teches_url }
      format.json { head :no_content }
    end
  end
end
