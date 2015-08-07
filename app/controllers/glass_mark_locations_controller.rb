class GlassMarkLocationsController < ApplicationController
  # GET /glass_mark_locations
  # GET /glass_mark_locations.json
  def index
    @glass_mark_locations = GlassMarkLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_mark_locations }
    end
  end

  # GET /glass_mark_locations/1
  # GET /glass_mark_locations/1.json
  def show
    @glass_mark_location = GlassMarkLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_mark_location }
    end
  end

  # GET /glass_mark_locations/new
  # GET /glass_mark_locations/new.json
  def new
    @glass_mark_location = GlassMarkLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_mark_location }
    end
  end

  # GET /glass_mark_locations/1/edit
  def edit
    @glass_mark_location = GlassMarkLocation.find(params[:id])
  end

  # POST /glass_mark_locations
  # POST /glass_mark_locations.json
  def create
    @glass_mark_location = GlassMarkLocation.new(params[:glass_mark_location])

    respond_to do |format|
      if @glass_mark_location.save
        format.html { redirect_to @glass_mark_location, notice: 'Glass mark location was successfully created.' }
        format.json { render json: @glass_mark_location, status: :created, location: @glass_mark_location }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_mark_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_mark_locations/1
  # PUT /glass_mark_locations/1.json
  def update
    @glass_mark_location = GlassMarkLocation.find(params[:id])

    respond_to do |format|
      if @glass_mark_location.update_attributes(params[:glass_mark_location])
        format.html { redirect_to @glass_mark_location, notice: 'Glass mark location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_mark_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_mark_locations/1
  # DELETE /glass_mark_locations/1.json
  def destroy
    @glass_mark_location = GlassMarkLocation.find(params[:id])
    @glass_mark_location.destroy

    respond_to do |format|
      format.html { redirect_to glass_mark_locations_url }
      format.json { head :no_content }
    end
  end
end
