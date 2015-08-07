class ProjectDrainagesController < ApplicationController
  # GET /project_drainages
  # GET /project_drainages.json
  def index
    @project_drainages = ProjectDrainage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_drainages }
    end
  end

  # GET /project_drainages/1
  # GET /project_drainages/1.json
  def show
    @project_drainage = ProjectDrainage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_drainage }
    end
  end

  # GET /project_drainages/new
  # GET /project_drainages/new.json
  def new
    @project_drainage = ProjectDrainage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_drainage }
    end
  end

  # GET /project_drainages/1/edit
  def edit
    @project_drainage = ProjectDrainage.find(params[:id])
  end

  # POST /project_drainages
  # POST /project_drainages.json
  def create
    @project_drainage = ProjectDrainage.new(params[:project_drainage])

    respond_to do |format|
      if @project_drainage.save
        format.html { redirect_to @project_drainage, notice: 'Project drainage was successfully created.' }
        format.json { render json: @project_drainage, status: :created, location: @project_drainage }
      else
        format.html { render action: "new" }
        format.json { render json: @project_drainage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_drainages/1
  # PUT /project_drainages/1.json
  def update
    @project_drainage = ProjectDrainage.find(params[:id])

    respond_to do |format|
      if @project_drainage.update_attributes(params[:project_drainage])
        format.html { redirect_to @project_drainage, notice: 'Project drainage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_drainage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_drainages/1
  # DELETE /project_drainages/1.json
  def destroy
    @project_drainage = ProjectDrainage.find(params[:id])
    @project_drainage.destroy

    respond_to do |format|
      format.html { redirect_to project_drainages_url }
      format.json { head :no_content }
    end
  end
end
