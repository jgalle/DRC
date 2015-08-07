class ProjectGeoDataController < ApplicationController
  # GET /project_geo_data
  # GET /project_geo_data.json
  def index
    @project_geo_data = ProjectGeoDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_geo_data }
    end
  end

  # GET /project_geo_data/1
  # GET /project_geo_data/1.json
  def show
    @project_geo_datum = ProjectGeoDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_geo_datum }
    end
  end

  # GET /project_geo_data/new
  # GET /project_geo_data/new.json
  def new
    @project_geo_datum = ProjectGeoDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_geo_datum }
    end
  end

  # GET /project_geo_data/1/edit
  def edit
    @project_geo_datum = ProjectGeoDatum.find(params[:id])
  end

  # POST /project_geo_data
  # POST /project_geo_data.json
  def create
    @project_geo_datum = ProjectGeoDatum.new(params[:project_geo_datum])

    respond_to do |format|
      if @project_geo_datum.save
        format.html { redirect_to @project_geo_datum, notice: 'Project geo datum was successfully created.' }
        format.json { render json: @project_geo_datum, status: :created, location: @project_geo_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @project_geo_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_geo_data/1
  # PUT /project_geo_data/1.json
  def update
    @project_geo_datum = ProjectGeoDatum.find(params[:id])

    respond_to do |format|
      if @project_geo_datum.update_attributes(params[:project_geo_datum])
        format.html { redirect_to @project_geo_datum, notice: 'Project geo datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_geo_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_geo_data/1
  # DELETE /project_geo_data/1.json
  def destroy
    @project_geo_datum = ProjectGeoDatum.find(params[:id])
    @project_geo_datum.destroy

    respond_to do |format|
      format.html { redirect_to project_geo_data_url }
      format.json { head :no_content }
    end
  end
end
