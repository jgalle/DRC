class ProjectElevationTypesController < ApplicationController
  # GET /project_elevation_types
  # GET /project_elevation_types.json
  def index
    @project_elevation_types = ProjectElevationType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_elevation_types }
    end
  end

  # GET /project_elevation_types/1
  # GET /project_elevation_types/1.json
  def show
    @project_elevation_type = ProjectElevationType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_elevation_type }
    end
  end

  # GET /project_elevation_types/new
  # GET /project_elevation_types/new.json
  def new
    @project_elevation_type = ProjectElevationType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_elevation_type }
    end
  end

  # GET /project_elevation_types/1/edit
  def edit
    @project_elevation_type = ProjectElevationType.find(params[:id])
  end

  # POST /project_elevation_types
  # POST /project_elevation_types.json
  def create
    @project_elevation_type = ProjectElevationType.new(params[:project_elevation_type])

    respond_to do |format|
      if @project_elevation_type.save
        format.html { redirect_to @project_elevation_type, notice: 'Project elevation type was successfully created.' }
        format.json { render json: @project_elevation_type, status: :created, location: @project_elevation_type }
      else
        format.html { render action: "new" }
        format.json { render json: @project_elevation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_elevation_types/1
  # PUT /project_elevation_types/1.json
  def update
    @project_elevation_type = ProjectElevationType.find(params[:id])

    respond_to do |format|
      if @project_elevation_type.update_attributes(params[:project_elevation_type])
        format.html { redirect_to @project_elevation_type, notice: 'Project elevation type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_elevation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_elevation_types/1
  # DELETE /project_elevation_types/1.json
  def destroy
    @project_elevation_type = ProjectElevationType.find(params[:id])
    @project_elevation_type.destroy

    respond_to do |format|
      format.html { redirect_to project_elevation_types_url }
      format.json { head :no_content }
    end
  end
end
