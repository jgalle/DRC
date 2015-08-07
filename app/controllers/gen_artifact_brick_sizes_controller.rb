class GenArtifactBrickSizesController < ApplicationController
  # GET /gen_artifact_brick_sizes
  # GET /gen_artifact_brick_sizes.json
  def index
    @gen_artifact_brick_sizes = GenArtifactBrickSize.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_brick_sizes }
    end
  end

  # GET /gen_artifact_brick_sizes/1
  # GET /gen_artifact_brick_sizes/1.json
  def show
    @gen_artifact_brick_size = GenArtifactBrickSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_brick_size }
    end
  end

  # GET /gen_artifact_brick_sizes/new
  # GET /gen_artifact_brick_sizes/new.json
  def new
    @gen_artifact_brick_size = GenArtifactBrickSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_brick_size }
    end
  end

  # GET /gen_artifact_brick_sizes/1/edit
  def edit
    @gen_artifact_brick_size = GenArtifactBrickSize.find(params[:id])
  end

  # POST /gen_artifact_brick_sizes
  # POST /gen_artifact_brick_sizes.json
  def create
    @gen_artifact_brick_size = GenArtifactBrickSize.new(params[:gen_artifact_brick_size])

    respond_to do |format|
      if @gen_artifact_brick_size.save
        format.html { redirect_to @gen_artifact_brick_size, notice: 'Gen artifact brick size was successfully created.' }
        format.json { render json: @gen_artifact_brick_size, status: :created, location: @gen_artifact_brick_size }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_brick_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_brick_sizes/1
  # PUT /gen_artifact_brick_sizes/1.json
  def update
    @gen_artifact_brick_size = GenArtifactBrickSize.find(params[:id])

    respond_to do |format|
      if @gen_artifact_brick_size.update_attributes(params[:gen_artifact_brick_size])
        format.html { redirect_to @gen_artifact_brick_size, notice: 'Gen artifact brick size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_brick_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_brick_sizes/1
  # DELETE /gen_artifact_brick_sizes/1.json
  def destroy
    @gen_artifact_brick_size = GenArtifactBrickSize.find(params[:id])
    @gen_artifact_brick_size.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_brick_sizes_url }
      format.json { head :no_content }
    end
  end
end
