class CeramicDecTechLocationsController < ApplicationController
  # GET /ceramic_dec_tech_locations
  # GET /ceramic_dec_tech_locations.json
  def index
    @ceramic_dec_tech_locations = CeramicDecTechLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_dec_tech_locations }
    end
  end

  # GET /ceramic_dec_tech_locations/1
  # GET /ceramic_dec_tech_locations/1.json
  def show
    @ceramic_dec_tech_location = CeramicDecTechLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_dec_tech_location }
    end
  end

  # GET /ceramic_dec_tech_locations/new
  # GET /ceramic_dec_tech_locations/new.json
  def new
    @ceramic_dec_tech_location = CeramicDecTechLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_dec_tech_location }
    end
  end

  # GET /ceramic_dec_tech_locations/1/edit
  def edit
    @ceramic_dec_tech_location = CeramicDecTechLocation.find(params[:id])
  end

  # POST /ceramic_dec_tech_locations
  # POST /ceramic_dec_tech_locations.json
  def create
    @ceramic_dec_tech_location = CeramicDecTechLocation.new(params[:ceramic_dec_tech_location])

    respond_to do |format|
      if @ceramic_dec_tech_location.save
        format.html { redirect_to @ceramic_dec_tech_location, notice: 'Ceramic dec tech location was successfully created.' }
        format.json { render json: @ceramic_dec_tech_location, status: :created, location: @ceramic_dec_tech_location }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_dec_tech_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_dec_tech_locations/1
  # PUT /ceramic_dec_tech_locations/1.json
  def update
    @ceramic_dec_tech_location = CeramicDecTechLocation.find(params[:id])

    respond_to do |format|
      if @ceramic_dec_tech_location.update_attributes(params[:ceramic_dec_tech_location])
        format.html { redirect_to @ceramic_dec_tech_location, notice: 'Ceramic dec tech location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_dec_tech_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_dec_tech_locations/1
  # DELETE /ceramic_dec_tech_locations/1.json
  def destroy
    @ceramic_dec_tech_location = CeramicDecTechLocation.find(params[:id])
    @ceramic_dec_tech_location.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_dec_tech_locations_url }
      format.json { head :no_content }
    end
  end
end
