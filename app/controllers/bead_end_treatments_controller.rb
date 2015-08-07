class BeadEndTreatmentsController < ApplicationController
  # GET /bead_end_treatments
  # GET /bead_end_treatments.json
  def index
    @bead_end_treatments = BeadEndTreatment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_end_treatments }
    end
  end

  # GET /bead_end_treatments/1
  # GET /bead_end_treatments/1.json
  def show
    @bead_end_treatment = BeadEndTreatment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_end_treatment }
    end
  end

  # GET /bead_end_treatments/new
  # GET /bead_end_treatments/new.json
  def new
    @bead_end_treatment = BeadEndTreatment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_end_treatment }
    end
  end

  # GET /bead_end_treatments/1/edit
  def edit
    @bead_end_treatment = BeadEndTreatment.find(params[:id])
  end

  # POST /bead_end_treatments
  # POST /bead_end_treatments.json
  def create
    @bead_end_treatment = BeadEndTreatment.new(params[:bead_end_treatment])

    respond_to do |format|
      if @bead_end_treatment.save
        format.html { redirect_to @bead_end_treatment, notice: 'Bead end treatment was successfully created.' }
        format.json { render json: @bead_end_treatment, status: :created, location: @bead_end_treatment }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_end_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_end_treatments/1
  # PUT /bead_end_treatments/1.json
  def update
    @bead_end_treatment = BeadEndTreatment.find(params[:id])

    respond_to do |format|
      if @bead_end_treatment.update_attributes(params[:bead_end_treatment])
        format.html { redirect_to @bead_end_treatment, notice: 'Bead end treatment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_end_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_end_treatments/1
  # DELETE /bead_end_treatments/1.json
  def destroy
    @bead_end_treatment = BeadEndTreatment.find(params[:id])
    @bead_end_treatment.destroy

    respond_to do |format|
      format.html { redirect_to bead_end_treatments_url }
      format.json { head :no_content }
    end
  end
end
