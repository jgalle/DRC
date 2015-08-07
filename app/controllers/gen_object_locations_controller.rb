class GenObjectLocationsController < ApplicationController
  # GET /gen_object_locations
  # GET /gen_object_locations.json
  def index
    @gen_object_locations = GenObjectLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_locations }
    end
  end

  # GET /gen_object_locations/1
  # GET /gen_object_locations/1.json
  def show
    @gen_object_location = GenObjectLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_location }
    end
  end

  # GET /gen_object_locations/new
  # GET /gen_object_locations/new.json
  def new
    @gen_object_location = GenObjectLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_location }
    end
  end

  # GET /gen_object_locations/1/edit
  def edit
    @gen_object_location = GenObjectLocation.find(params[:id])
  end

  # POST /gen_object_locations
  # POST /gen_object_locations.json
  def create
    @gen_object_location = GenObjectLocation.new(params[:gen_object_location])

    respond_to do |format|
      if @gen_object_location.save
        format.html { redirect_to @gen_object_location, notice: 'Gen object location was successfully created.' }
        format.json { render json: @gen_object_location, status: :created, location: @gen_object_location }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_locations/1
  # PUT /gen_object_locations/1.json
  def update
    @gen_object_location = GenObjectLocation.find(params[:id])

    respond_to do |format|
      if @gen_object_location.update_attributes(params[:gen_object_location])
        format.html { redirect_to @gen_object_location, notice: 'Gen object location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_locations/1
  # DELETE /gen_object_locations/1.json
  def destroy
    @gen_object_location = GenObjectLocation.find(params[:id])
    @gen_object_location.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_locations_url }
      format.json { head :no_content }
    end
  end
end
