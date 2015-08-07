class ContextSampleLocationsController < ApplicationController
  before_action :set_context_sample_location, only: [:show, :edit, :update, :destroy]

  # GET /context_sample_locations
  # GET /context_sample_locations.json
  def index
    @context_sample_locations = ContextSampleLocation.all
  end

  # GET /context_sample_locations/1
  # GET /context_sample_locations/1.json
  def show
  end

  # GET /context_sample_locations/new
  def new
    @context_sample_location = ContextSampleLocation.new
  end

  # GET /context_sample_locations/1/edit
  def edit
  end

  # POST /context_sample_locations
  # POST /context_sample_locations.json
  def create
    @context_sample_location = ContextSampleLocation.new(context_sample_location_params)

    respond_to do |format|
      if @context_sample_location.save
        format.html { redirect_to @context_sample_location, notice: 'Context sample location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @context_sample_location }
      else
        format.html { render action: 'new' }
        format.json { render json: @context_sample_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /context_sample_locations/1
  # PATCH/PUT /context_sample_locations/1.json
  def update
    respond_to do |format|
      if @context_sample_location.update(context_sample_location_params)
        format.html { redirect_to @context_sample_location, notice: 'Context sample location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @context_sample_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_sample_locations/1
  # DELETE /context_sample_locations/1.json
  def destroy
    @context_sample_location.destroy
    respond_to do |format|
      format.html { redirect_to context_sample_locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_context_sample_location
      @context_sample_location = ContextSampleLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def context_sample_location_params
      params[:context_sample_location]
    end
end
