class ProjectWebsiteRegionsController < ApplicationController
  before_action :set_project_website_region, only: [:show, :edit, :update, :destroy]

  # GET /project_website_regions
  # GET /project_website_regions.json
  def index
    @project_website_regions = ProjectWebsiteRegion.all
  end

  # GET /project_website_regions/1
  # GET /project_website_regions/1.json
  def show
  end

  # GET /project_website_regions/new
  def new
    @project_website_region = ProjectWebsiteRegion.new
  end

  # GET /project_website_regions/1/edit
  def edit
  end

  # POST /project_website_regions
  # POST /project_website_regions.json
  def create
    @project_website_region = ProjectWebsiteRegion.new(project_website_region_params)

    respond_to do |format|
      if @project_website_region.save
        format.html { redirect_to @project_website_region, notice: 'Project website region was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_website_region }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_website_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_website_regions/1
  # PATCH/PUT /project_website_regions/1.json
  def update
    respond_to do |format|
      if @project_website_region.update(project_website_region_params)
        format.html { redirect_to @project_website_region, notice: 'Project website region was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_website_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_website_regions/1
  # DELETE /project_website_regions/1.json
  def destroy
    @project_website_region.destroy
    respond_to do |format|
      format.html { redirect_to project_website_regions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_website_region
      @project_website_region = ProjectWebsiteRegion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_website_region_params
      params[:project_website_region]
    end
end
