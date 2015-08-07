class BoneMarkLocationsController < ApplicationController
  # GET /bone_mark_locations
  # GET /bone_mark_locations.json
  def index
    @bone_mark_locations = BoneMarkLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_mark_locations }
    end
  end

  # GET /bone_mark_locations/1
  # GET /bone_mark_locations/1.json
  def show
    @bone_mark_location = BoneMarkLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_mark_location }
    end
  end

  # GET /bone_mark_locations/new
  # GET /bone_mark_locations/new.json
  def new
    @bone_mark_location = BoneMarkLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_mark_location }
    end
  end

  # GET /bone_mark_locations/1/edit
  def edit
    @bone_mark_location = BoneMarkLocation.find(params[:id])
  end

  # POST /bone_mark_locations
  # POST /bone_mark_locations.json
  def create
    @bone_mark_location = BoneMarkLocation.new(params[:bone_mark_location])

    respond_to do |format|
      if @bone_mark_location.save
        format.html { redirect_to @bone_mark_location, notice: 'Bone mark location was successfully created.' }
        format.json { render json: @bone_mark_location, status: :created, location: @bone_mark_location }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_mark_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_mark_locations/1
  # PUT /bone_mark_locations/1.json
  def update
    @bone_mark_location = BoneMarkLocation.find(params[:id])

    respond_to do |format|
      if @bone_mark_location.update_attributes(params[:bone_mark_location])
        format.html { redirect_to @bone_mark_location, notice: 'Bone mark location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_mark_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_mark_locations/1
  # DELETE /bone_mark_locations/1.json
  def destroy
    @bone_mark_location = BoneMarkLocation.find(params[:id])
    @bone_mark_location.destroy

    respond_to do |format|
      format.html { redirect_to bone_mark_locations_url }
      format.json { head :no_content }
    end
  end
end
