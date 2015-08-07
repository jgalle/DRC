class ProjectPlaceNamesController < ApplicationController
  # GET /project_place_names
  # GET /project_place_names.json
  def index
    @project_place_names = ProjectPlaceName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_place_names }
    end
  end

  # GET /project_place_names/1
  # GET /project_place_names/1.json
  def show
    @project_place_name = ProjectPlaceName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_place_name }
    end
  end

  # GET /project_place_names/new
  # GET /project_place_names/new.json
  def new
    @project_place_name = ProjectPlaceName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_place_name }
    end
  end

  # GET /project_place_names/1/edit
  def edit
    @project_place_name = ProjectPlaceName.find(params[:id])
  end

  # POST /project_place_names
  # POST /project_place_names.json
  def create
    @project_place_name = ProjectPlaceName.new(params[:project_place_name])

    respond_to do |format|
      if @project_place_name.save
        format.html { redirect_to @project_place_name, notice: 'Project place name was successfully created.' }
        format.json { render json: @project_place_name, status: :created, location: @project_place_name }
      else
        format.html { render action: "new" }
        format.json { render json: @project_place_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_place_names/1
  # PUT /project_place_names/1.json
  def update
    @project_place_name = ProjectPlaceName.find(params[:id])

    respond_to do |format|
      if @project_place_name.update_attributes(params[:project_place_name])
        format.html { redirect_to @project_place_name, notice: 'Project place name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_place_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_place_names/1
  # DELETE /project_place_names/1.json
  def destroy
    @project_place_name = ProjectPlaceName.find(params[:id])
    @project_place_name.destroy

    respond_to do |format|
      format.html { redirect_to project_place_names_url }
      format.json { head :no_content }
    end
  end
end
