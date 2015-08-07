class ContextElevationLocationsController < ApplicationController
  # GET /context_elevation_locations
  # GET /context_elevation_locations.json
  def index
    @context_elevation_locations = ContextElevationLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_elevation_locations }
    end
  end

  # GET /context_elevation_locations/1
  # GET /context_elevation_locations/1.json
  def show
    @context_elevation_location = ContextElevationLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_elevation_location }
    end
  end

  # GET /context_elevation_locations/new
  # GET /context_elevation_locations/new.json
  def new
    @context_elevation_location = ContextElevationLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_elevation_location }
    end
  end

  # GET /context_elevation_locations/1/edit
  def edit
    @context_elevation_location = ContextElevationLocation.find(params[:id])
  end

  # POST /context_elevation_locations
  # POST /context_elevation_locations.json
  def create
    @context_elevation_location = ContextElevationLocation.new(params[:context_elevation_location])

    respond_to do |format|
      if @context_elevation_location.save
        format.html { redirect_to @context_elevation_location, notice: 'Context elevation location was successfully created.' }
        format.json { render json: @context_elevation_location, status: :created, location: @context_elevation_location }
      else
        format.html { render action: "new" }
        format.json { render json: @context_elevation_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_elevation_locations/1
  # PUT /context_elevation_locations/1.json
  def update
    @context_elevation_location = ContextElevationLocation.find(params[:id])

    respond_to do |format|
      if @context_elevation_location.update_attributes(params[:context_elevation_location])
        format.html { redirect_to @context_elevation_location, notice: 'Context elevation location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_elevation_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_elevation_locations/1
  # DELETE /context_elevation_locations/1.json
  def destroy
    @context_elevation_location = ContextElevationLocation.find(params[:id])
    @context_elevation_location.destroy

    respond_to do |format|
      format.html { redirect_to context_elevation_locations_url }
      format.json { head :no_content }
    end
  end
end
