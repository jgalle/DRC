class GenArtifactNailHeadsController < ApplicationController
  # GET /gen_artifact_nail_heads
  # GET /gen_artifact_nail_heads.json
  def index
    @gen_artifact_nail_heads = GenArtifactNailHead.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_nail_heads }
    end
  end

  # GET /gen_artifact_nail_heads/1
  # GET /gen_artifact_nail_heads/1.json
  def show
    @gen_artifact_nail_head = GenArtifactNailHead.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_nail_head }
    end
  end

  # GET /gen_artifact_nail_heads/new
  # GET /gen_artifact_nail_heads/new.json
  def new
    @gen_artifact_nail_head = GenArtifactNailHead.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_nail_head }
    end
  end

  # GET /gen_artifact_nail_heads/1/edit
  def edit
    @gen_artifact_nail_head = GenArtifactNailHead.find(params[:id])
  end

  # POST /gen_artifact_nail_heads
  # POST /gen_artifact_nail_heads.json
  def create
    @gen_artifact_nail_head = GenArtifactNailHead.new(params[:gen_artifact_nail_head])

    respond_to do |format|
      if @gen_artifact_nail_head.save
        format.html { redirect_to @gen_artifact_nail_head, notice: 'Gen artifact nail head was successfully created.' }
        format.json { render json: @gen_artifact_nail_head, status: :created, location: @gen_artifact_nail_head }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_nail_head.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_nail_heads/1
  # PUT /gen_artifact_nail_heads/1.json
  def update
    @gen_artifact_nail_head = GenArtifactNailHead.find(params[:id])

    respond_to do |format|
      if @gen_artifact_nail_head.update_attributes(params[:gen_artifact_nail_head])
        format.html { redirect_to @gen_artifact_nail_head, notice: 'Gen artifact nail head was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_nail_head.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_nail_heads/1
  # DELETE /gen_artifact_nail_heads/1.json
  def destroy
    @gen_artifact_nail_head = GenArtifactNailHead.find(params[:id])
    @gen_artifact_nail_head.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_nail_heads_url }
      format.json { head :no_content }
    end
  end
end
