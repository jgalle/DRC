class ProjectUnitofMeasuresController < ApplicationController
  # GET /project_unitof_measures
  # GET /project_unitof_measures.json
  def index
    @project_unitof_measures = ProjectUnitofMeasure.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_unitof_measures }
    end
  end

  # GET /project_unitof_measures/1
  # GET /project_unitof_measures/1.json
  def show
    @project_unitof_measure = ProjectUnitofMeasure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_unitof_measure }
    end
  end

  # GET /project_unitof_measures/new
  # GET /project_unitof_measures/new.json
  def new
    @project_unitof_measure = ProjectUnitofMeasure.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_unitof_measure }
    end
  end

  # GET /project_unitof_measures/1/edit
  def edit
    @project_unitof_measure = ProjectUnitofMeasure.find(params[:id])
  end

  # POST /project_unitof_measures
  # POST /project_unitof_measures.json
  def create
    @project_unitof_measure = ProjectUnitofMeasure.new(params[:project_unitof_measure])

    respond_to do |format|
      if @project_unitof_measure.save
        format.html { redirect_to @project_unitof_measure, notice: 'Project unitof measure was successfully created.' }
        format.json { render json: @project_unitof_measure, status: :created, location: @project_unitof_measure }
      else
        format.html { render action: "new" }
        format.json { render json: @project_unitof_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_unitof_measures/1
  # PUT /project_unitof_measures/1.json
  def update
    @project_unitof_measure = ProjectUnitofMeasure.find(params[:id])

    respond_to do |format|
      if @project_unitof_measure.update_attributes(params[:project_unitof_measure])
        format.html { redirect_to @project_unitof_measure, notice: 'Project unitof measure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_unitof_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_unitof_measures/1
  # DELETE /project_unitof_measures/1.json
  def destroy
    @project_unitof_measure = ProjectUnitofMeasure.find(params[:id])
    @project_unitof_measure.destroy

    respond_to do |format|
      format.html { redirect_to project_unitof_measures_url }
      format.json { head :no_content }
    end
  end
end
