class ProjectRegionsController < ApplicationController
  # GET /project_regions
  # GET /project_regions.json
  def index
    @project_regions = ProjectRegion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_regions }
    end
  end

  # GET /project_regions/1
  # GET /project_regions/1.json
  def show
    @project_region = ProjectRegion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_region }
    end
  end

  # GET /project_regions/new
  # GET /project_regions/new.json
  def new
    @project_region = ProjectRegion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_region }
    end
  end

  # GET /project_regions/1/edit
  def edit
    @project_region = ProjectRegion.find(params[:id])
  end

  # POST /project_regions
  # POST /project_regions.json
  def create
    @project_region = ProjectRegion.new(params[:project_region])

    respond_to do |format|
      if @project_region.save
        format.html { redirect_to @project_region, notice: 'Project region was successfully created.' }
        format.json { render json: @project_region, status: :created, location: @project_region }
      else
        format.html { render action: "new" }
        format.json { render json: @project_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_regions/1
  # PUT /project_regions/1.json
  def update
    @project_region = ProjectRegion.find(params[:id])

    respond_to do |format|
      if @project_region.update_attributes(params[:project_region])
        format.html { redirect_to @project_region, notice: 'Project region was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_regions/1
  # DELETE /project_regions/1.json
  def destroy
    @project_region = ProjectRegion.find(params[:id])
    @project_region.destroy

    respond_to do |format|
      format.html { redirect_to project_regions_url }
      format.json { head :no_content }
    end
  end
end
