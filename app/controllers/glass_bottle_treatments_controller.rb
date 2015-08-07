class GlassBottleTreatmentsController < ApplicationController
  # GET /glass_bottle_treatments
  # GET /glass_bottle_treatments.json
  def index
    @glass_bottle_treatments = GlassBottleTreatment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_bottle_treatments }
    end
  end

  # GET /glass_bottle_treatments/1
  # GET /glass_bottle_treatments/1.json
  def show
    @glass_bottle_treatment = GlassBottleTreatment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_bottle_treatment }
    end
  end

  # GET /glass_bottle_treatments/new
  # GET /glass_bottle_treatments/new.json
  def new
    @glass_bottle_treatment = GlassBottleTreatment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_bottle_treatment }
    end
  end

  # GET /glass_bottle_treatments/1/edit
  def edit
    @glass_bottle_treatment = GlassBottleTreatment.find(params[:id])
  end

  # POST /glass_bottle_treatments
  # POST /glass_bottle_treatments.json
  def create
    @glass_bottle_treatment = GlassBottleTreatment.new(params[:glass_bottle_treatment])

    respond_to do |format|
      if @glass_bottle_treatment.save
        format.html { redirect_to @glass_bottle_treatment, notice: 'Glass bottle treatment was successfully created.' }
        format.json { render json: @glass_bottle_treatment, status: :created, location: @glass_bottle_treatment }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_bottle_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_bottle_treatments/1
  # PUT /glass_bottle_treatments/1.json
  def update
    @glass_bottle_treatment = GlassBottleTreatment.find(params[:id])

    respond_to do |format|
      if @glass_bottle_treatment.update_attributes(params[:glass_bottle_treatment])
        format.html { redirect_to @glass_bottle_treatment, notice: 'Glass bottle treatment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_bottle_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_bottle_treatments/1
  # DELETE /glass_bottle_treatments/1.json
  def destroy
    @glass_bottle_treatment = GlassBottleTreatment.find(params[:id])
    @glass_bottle_treatment.destroy

    respond_to do |format|
      format.html { redirect_to glass_bottle_treatments_url }
      format.json { head :no_content }
    end
  end
end
