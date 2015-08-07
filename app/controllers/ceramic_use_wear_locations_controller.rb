class CeramicUseWearLocationsController < ApplicationController
  # GET /ceramic_use_wear_locations
  # GET /ceramic_use_wear_locations.json
  def index
    @ceramic_use_wear_locations = CeramicUseWearLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_use_wear_locations }
    end
  end

  # GET /ceramic_use_wear_locations/1
  # GET /ceramic_use_wear_locations/1.json
  def show
    @ceramic_use_wear_location = CeramicUseWearLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_use_wear_location }
    end
  end

  # GET /ceramic_use_wear_locations/new
  # GET /ceramic_use_wear_locations/new.json
  def new
    @ceramic_use_wear_location = CeramicUseWearLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_use_wear_location }
    end
  end

  # GET /ceramic_use_wear_locations/1/edit
  def edit
    @ceramic_use_wear_location = CeramicUseWearLocation.find(params[:id])
  end

  # POST /ceramic_use_wear_locations
  # POST /ceramic_use_wear_locations.json
  def create
    @ceramic_use_wear_location = CeramicUseWearLocation.new(params[:ceramic_use_wear_location])

    respond_to do |format|
      if @ceramic_use_wear_location.save
        format.html { redirect_to @ceramic_use_wear_location, notice: 'Ceramic use wear location was successfully created.' }
        format.json { render json: @ceramic_use_wear_location, status: :created, location: @ceramic_use_wear_location }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_use_wear_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_use_wear_locations/1
  # PUT /ceramic_use_wear_locations/1.json
  def update
    @ceramic_use_wear_location = CeramicUseWearLocation.find(params[:id])

    respond_to do |format|
      if @ceramic_use_wear_location.update_attributes(params[:ceramic_use_wear_location])
        format.html { redirect_to @ceramic_use_wear_location, notice: 'Ceramic use wear location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_use_wear_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_use_wear_locations/1
  # DELETE /ceramic_use_wear_locations/1.json
  def destroy
    @ceramic_use_wear_location = CeramicUseWearLocation.find(params[:id])
    @ceramic_use_wear_location.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_use_wear_locations_url }
      format.json { head :no_content }
    end
  end
end
