class ProjectLevelofTreatmentsController < ApplicationController
  # GET /project_levelof_treatments
  # GET /project_levelof_treatments.json
  def index
    @project_levelof_treatments = ProjectLevelofTreatment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_levelof_treatments }
    end
  end

  # GET /project_levelof_treatments/1
  # GET /project_levelof_treatments/1.json
  def show
    @project_levelof_treatment = ProjectLevelofTreatment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_levelof_treatment }
    end
  end

  # GET /project_levelof_treatments/new
  # GET /project_levelof_treatments/new.json
  def new
    @project_levelof_treatment = ProjectLevelofTreatment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_levelof_treatment }
    end
  end

  # GET /project_levelof_treatments/1/edit
  def edit
    @project_levelof_treatment = ProjectLevelofTreatment.find(params[:id])
  end

  # POST /project_levelof_treatments
  # POST /project_levelof_treatments.json
  def create
    @project_levelof_treatment = ProjectLevelofTreatment.new(params[:project_levelof_treatment])

    respond_to do |format|
      if @project_levelof_treatment.save
        format.html { redirect_to @project_levelof_treatment, notice: 'Project levelof treatment was successfully created.' }
        format.json { render json: @project_levelof_treatment, status: :created, location: @project_levelof_treatment }
      else
        format.html { render action: "new" }
        format.json { render json: @project_levelof_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_levelof_treatments/1
  # PUT /project_levelof_treatments/1.json
  def update
    @project_levelof_treatment = ProjectLevelofTreatment.find(params[:id])

    respond_to do |format|
      if @project_levelof_treatment.update_attributes(params[:project_levelof_treatment])
        format.html { redirect_to @project_levelof_treatment, notice: 'Project levelof treatment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_levelof_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_levelof_treatments/1
  # DELETE /project_levelof_treatments/1.json
  def destroy
    @project_levelof_treatment = ProjectLevelofTreatment.find(params[:id])
    @project_levelof_treatment.destroy

    respond_to do |format|
      format.html { redirect_to project_levelof_treatments_url }
      format.json { head :no_content }
    end
  end
end
