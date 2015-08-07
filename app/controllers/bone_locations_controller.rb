class BoneLocationsController < ApplicationController
  # GET /bone_locations
  # GET /bone_locations.json
  def index
    @bone_locations = BoneLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_locations }
    end
  end

  # GET /bone_locations/1
  # GET /bone_locations/1.json
  def show
    @bone_location = BoneLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_location }
    end
  end

  # GET /bone_locations/new
  # GET /bone_locations/new.json
  def new
    @bone_location = BoneLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_location }
    end
  end

  # GET /bone_locations/1/edit
  def edit
    @bone_location = BoneLocation.find(params[:id])
  end

  # POST /bone_locations
  # POST /bone_locations.json
  def create
    @bone_location = BoneLocation.new(params[:bone_location])

    respond_to do |format|
      if @bone_location.save
        format.html { redirect_to @bone_location, notice: 'Bone location was successfully created.' }
        format.json { render json: @bone_location, status: :created, location: @bone_location }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_locations/1
  # PUT /bone_locations/1.json
  def update
    @bone_location = BoneLocation.find(params[:id])

    respond_to do |format|
      if @bone_location.update_attributes(params[:bone_location])
        format.html { redirect_to @bone_location, notice: 'Bone location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_locations/1
  # DELETE /bone_locations/1.json
  def destroy
    @bone_location = BoneLocation.find(params[:id])
    @bone_location.destroy

    respond_to do |format|
      format.html { redirect_to bone_locations_url }
      format.json { head :no_content }
    end
  end
end
