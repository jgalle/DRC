class ProjectInstitutionsController < ApplicationController
  # GET /project_institutions
  # GET /project_institutions.json
  def index
    @project_institutions = ProjectInstitution.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_institutions }
    end
  end

  # GET /project_institutions/1
  # GET /project_institutions/1.json
  def show
    @project_institution = ProjectInstitution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_institution }
    end
  end

  # GET /project_institutions/new
  # GET /project_institutions/new.json
  def new
    @project_institution = ProjectInstitution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_institution }
    end
  end

  # GET /project_institutions/1/edit
  def edit
    @project_institution = ProjectInstitution.find(params[:id])
  end

  # POST /project_institutions
  # POST /project_institutions.json
  def create
    @project_institution = ProjectInstitution.new(params[:project_institution])

    respond_to do |format|
      if @project_institution.save
        format.html { redirect_to @project_institution, notice: 'Project institution was successfully created.' }
        format.json { render json: @project_institution, status: :created, location: @project_institution }
      else
        format.html { render action: "new" }
        format.json { render json: @project_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_institutions/1
  # PUT /project_institutions/1.json
  def update
    @project_institution = ProjectInstitution.find(params[:id])

    respond_to do |format|
      if @project_institution.update_attributes(params[:project_institution])
        format.html { redirect_to @project_institution, notice: 'Project institution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_institutions/1
  # DELETE /project_institutions/1.json
  def destroy
    @project_institution = ProjectInstitution.find(params[:id])
    @project_institution.destroy

    respond_to do |format|
      format.html { redirect_to project_institutions_url }
      format.json { head :no_content }
    end
  end
end
