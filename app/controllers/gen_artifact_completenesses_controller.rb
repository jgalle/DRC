class GenArtifactCompletenessesController < ApplicationController
  # GET /gen_artifact_completenesses
  # GET /gen_artifact_completenesses.json
  def index
    @gen_artifact_completenesses = GenArtifactCompleteness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_completenesses }
    end
  end

  # GET /gen_artifact_completenesses/1
  # GET /gen_artifact_completenesses/1.json
  def show
    @gen_artifact_completeness = GenArtifactCompleteness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_completeness }
    end
  end

  # GET /gen_artifact_completenesses/new
  # GET /gen_artifact_completenesses/new.json
  def new
    @gen_artifact_completeness = GenArtifactCompleteness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_completeness }
    end
  end

  # GET /gen_artifact_completenesses/1/edit
  def edit
    @gen_artifact_completeness = GenArtifactCompleteness.find(params[:id])
  end

  # POST /gen_artifact_completenesses
  # POST /gen_artifact_completenesses.json
  def create
    @gen_artifact_completeness = GenArtifactCompleteness.new(params[:gen_artifact_completeness])

    respond_to do |format|
      if @gen_artifact_completeness.save
        format.html { redirect_to @gen_artifact_completeness, notice: 'Gen artifact completeness was successfully created.' }
        format.json { render json: @gen_artifact_completeness, status: :created, location: @gen_artifact_completeness }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_completenesses/1
  # PUT /gen_artifact_completenesses/1.json
  def update
    @gen_artifact_completeness = GenArtifactCompleteness.find(params[:id])

    respond_to do |format|
      if @gen_artifact_completeness.update_attributes(params[:gen_artifact_completeness])
        format.html { redirect_to @gen_artifact_completeness, notice: 'Gen artifact completeness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_completenesses/1
  # DELETE /gen_artifact_completenesses/1.json
  def destroy
    @gen_artifact_completeness = GenArtifactCompleteness.find(params[:id])
    @gen_artifact_completeness.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_completenesses_url }
      format.json { head :no_content }
    end
  end
end
