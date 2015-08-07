class ProjectNamesController < ApplicationController
  # GET /project_names
  # GET /project_names.json
  def index
    @project_names = ProjectName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_names }
    end
  end

  # GET /project_names/1
  # GET /project_names/1.json
  def show
    @project_name = ProjectName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_name }
    end
  end

  # GET /project_names/new
  # GET /project_names/new.json
  def new
    @project_name = ProjectName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_name }
    end
  end

  # GET /project_names/1/edit
  def edit
    @project_name = ProjectName.find(params[:id])
  end

  # POST /project_names
  # POST /project_names.json
  def create
    @project_name = ProjectName.new(params[:project_name])

    respond_to do |format|
      if @project_name.save
        format.html { redirect_to @project_name, notice: 'Project name was successfully created.' }
        format.json { render json: @project_name, status: :created, location: @project_name }
      else
        format.html { render action: "new" }
        format.json { render json: @project_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_names/1
  # PUT /project_names/1.json
  def update
    @project_name = ProjectName.find(params[:id])

    respond_to do |format|
      if @project_name.update_attributes(params[:project_name])
        format.html { redirect_to @project_name, notice: 'Project name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_names/1
  # DELETE /project_names/1.json
  def destroy
    @project_name = ProjectName.find(params[:id])
    @project_name.destroy

    respond_to do |format|
      format.html { redirect_to project_names_url }
      format.json { head :no_content }
    end
  end
end
