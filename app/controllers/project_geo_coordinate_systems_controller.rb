class ProjectGeoCoordinateSystemsController < ApplicationController
  # GET /project_geo_coordinate_systems
  # GET /project_geo_coordinate_systems.json
  def index
    @project_geo_coordinate_systems = ProjectGeoCoordinateSystem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_geo_coordinate_systems }
    end
  end

  # GET /project_geo_coordinate_systems/1
  # GET /project_geo_coordinate_systems/1.json
  def show
    @project_geo_coordinate_system = ProjectGeoCoordinateSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_geo_coordinate_system }
    end
  end

  # GET /project_geo_coordinate_systems/new
  # GET /project_geo_coordinate_systems/new.json
  def new
    @project_geo_coordinate_system = ProjectGeoCoordinateSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_geo_coordinate_system }
    end
  end

  # GET /project_geo_coordinate_systems/1/edit
  def edit
    @project_geo_coordinate_system = ProjectGeoCoordinateSystem.find(params[:id])
  end

  # POST /project_geo_coordinate_systems
  # POST /project_geo_coordinate_systems.json
  def create
    @project_geo_coordinate_system = ProjectGeoCoordinateSystem.new(params[:project_geo_coordinate_system])

    respond_to do |format|
      if @project_geo_coordinate_system.save
        format.html { redirect_to @project_geo_coordinate_system, notice: 'Project geo coordinate system was successfully created.' }
        format.json { render json: @project_geo_coordinate_system, status: :created, location: @project_geo_coordinate_system }
      else
        format.html { render action: "new" }
        format.json { render json: @project_geo_coordinate_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_geo_coordinate_systems/1
  # PUT /project_geo_coordinate_systems/1.json
  def update
    @project_geo_coordinate_system = ProjectGeoCoordinateSystem.find(params[:id])

    respond_to do |format|
      if @project_geo_coordinate_system.update_attributes(params[:project_geo_coordinate_system])
        format.html { redirect_to @project_geo_coordinate_system, notice: 'Project geo coordinate system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_geo_coordinate_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_geo_coordinate_systems/1
  # DELETE /project_geo_coordinate_systems/1.json
  def destroy
    @project_geo_coordinate_system = ProjectGeoCoordinateSystem.find(params[:id])
    @project_geo_coordinate_system.destroy

    respond_to do |format|
      format.html { redirect_to project_geo_coordinate_systems_url }
      format.json { head :no_content }
    end
  end
end
