class GenArtifactCategoriesController < ApplicationController
  # GET /gen_artifact_categories
  # GET /gen_artifact_categories.json
  def index
    @gen_artifact_categories = GenArtifactCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_categories }
    end
  end

  # GET /gen_artifact_categories/1
  # GET /gen_artifact_categories/1.json
  def show
    @gen_artifact_category = GenArtifactCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_category }
    end
  end

  # GET /gen_artifact_categories/new
  # GET /gen_artifact_categories/new.json
  def new
    @gen_artifact_category = GenArtifactCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_category }
    end
  end

  # GET /gen_artifact_categories/1/edit
  def edit
    @gen_artifact_category = GenArtifactCategory.find(params[:id])
  end

  # POST /gen_artifact_categories
  # POST /gen_artifact_categories.json
  def create
    @gen_artifact_category = GenArtifactCategory.new(params[:gen_artifact_category])

    respond_to do |format|
      if @gen_artifact_category.save
        format.html { redirect_to @gen_artifact_category, notice: 'Gen artifact category was successfully created.' }
        format.json { render json: @gen_artifact_category, status: :created, location: @gen_artifact_category }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_categories/1
  # PUT /gen_artifact_categories/1.json
  def update
    @gen_artifact_category = GenArtifactCategory.find(params[:id])

    respond_to do |format|
      if @gen_artifact_category.update_attributes(params[:gen_artifact_category])
        format.html { redirect_to @gen_artifact_category, notice: 'Gen artifact category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_categories/1
  # DELETE /gen_artifact_categories/1.json
  def destroy
    @gen_artifact_category = GenArtifactCategory.find(params[:id])
    @gen_artifact_category.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_categories_url }
      format.json { head :no_content }
    end
  end
end
