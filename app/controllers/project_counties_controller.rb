class ProjectCountiesController < ApplicationController
  # GET /project_counties
  # GET /project_counties.json
  def index
    @project_counties = ProjectCounty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_counties }
    end
  end

  # GET /project_counties/1
  # GET /project_counties/1.json
  def show
    @project_county = ProjectCounty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_county }
    end
  end

  # GET /project_counties/new
  # GET /project_counties/new.json
  def new
    @project_county = ProjectCounty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_county }
    end
  end

  # GET /project_counties/1/edit
  def edit
    @project_county = ProjectCounty.find(params[:id])
  end

  # POST /project_counties
  # POST /project_counties.json
  def create
    @project_county = ProjectCounty.new(params[:project_county])

    respond_to do |format|
      if @project_county.save
        format.html { redirect_to @project_county, notice: 'Project county was successfully created.' }
        format.json { render json: @project_county, status: :created, location: @project_county }
      else
        format.html { render action: "new" }
        format.json { render json: @project_county.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_counties/1
  # PUT /project_counties/1.json
  def update
    @project_county = ProjectCounty.find(params[:id])

    respond_to do |format|
      if @project_county.update_attributes(params[:project_county])
        format.html { redirect_to @project_county, notice: 'Project county was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_county.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_counties/1
  # DELETE /project_counties/1.json
  def destroy
    @project_county = ProjectCounty.find(params[:id])
    @project_county.destroy

    respond_to do |format|
      format.html { redirect_to project_counties_url }
      format.json { head :no_content }
    end
  end
end
