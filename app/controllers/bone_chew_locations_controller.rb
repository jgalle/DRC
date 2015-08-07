class BoneChewLocationsController < ApplicationController
  # GET /bone_chew_locations
  # GET /bone_chew_locations.json
  def index
    @bone_chew_locations = BoneChewLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_chew_locations }
    end
  end

  # GET /bone_chew_locations/1
  # GET /bone_chew_locations/1.json
  def show
    @bone_chew_location = BoneChewLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_chew_location }
    end
  end

  # GET /bone_chew_locations/new
  # GET /bone_chew_locations/new.json
  def new
    @bone_chew_location = BoneChewLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_chew_location }
    end
  end

  # GET /bone_chew_locations/1/edit
  def edit
    @bone_chew_location = BoneChewLocation.find(params[:id])
  end

  # POST /bone_chew_locations
  # POST /bone_chew_locations.json
  def create
    @bone_chew_location = BoneChewLocation.new(params[:bone_chew_location])

    respond_to do |format|
      if @bone_chew_location.save
        format.html { redirect_to @bone_chew_location, notice: 'Bone chew location was successfully created.' }
        format.json { render json: @bone_chew_location, status: :created, location: @bone_chew_location }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_chew_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_chew_locations/1
  # PUT /bone_chew_locations/1.json
  def update
    @bone_chew_location = BoneChewLocation.find(params[:id])

    respond_to do |format|
      if @bone_chew_location.update_attributes(params[:bone_chew_location])
        format.html { redirect_to @bone_chew_location, notice: 'Bone chew location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_chew_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_chew_locations/1
  # DELETE /bone_chew_locations/1.json
  def destroy
    @bone_chew_location = BoneChewLocation.find(params[:id])
    @bone_chew_location.destroy

    respond_to do |format|
      format.html { redirect_to bone_chew_locations_url }
      format.json { head :no_content }
    end
  end
end
