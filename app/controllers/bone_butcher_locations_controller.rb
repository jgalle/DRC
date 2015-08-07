class BoneButcherLocationsController < ApplicationController
  # GET /bone_butcher_locations
  # GET /bone_butcher_locations.json
  def index
    @bone_butcher_locations = BoneButcherLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_butcher_locations }
    end
  end

  # GET /bone_butcher_locations/1
  # GET /bone_butcher_locations/1.json
  def show
    @bone_butcher_location = BoneButcherLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_butcher_location }
    end
  end

  # GET /bone_butcher_locations/new
  # GET /bone_butcher_locations/new.json
  def new
    @bone_butcher_location = BoneButcherLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_butcher_location }
    end
  end

  # GET /bone_butcher_locations/1/edit
  def edit
    @bone_butcher_location = BoneButcherLocation.find(params[:id])
  end

  # POST /bone_butcher_locations
  # POST /bone_butcher_locations.json
  def create
    @bone_butcher_location = BoneButcherLocation.new(params[:bone_butcher_location])

    respond_to do |format|
      if @bone_butcher_location.save
        format.html { redirect_to @bone_butcher_location, notice: 'Bone butcher location was successfully created.' }
        format.json { render json: @bone_butcher_location, status: :created, location: @bone_butcher_location }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_butcher_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_butcher_locations/1
  # PUT /bone_butcher_locations/1.json
  def update
    @bone_butcher_location = BoneButcherLocation.find(params[:id])

    respond_to do |format|
      if @bone_butcher_location.update_attributes(params[:bone_butcher_location])
        format.html { redirect_to @bone_butcher_location, notice: 'Bone butcher location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_butcher_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_butcher_locations/1
  # DELETE /bone_butcher_locations/1.json
  def destroy
    @bone_butcher_location = BoneButcherLocation.find(params[:id])
    @bone_butcher_location.destroy

    respond_to do |format|
      format.html { redirect_to bone_butcher_locations_url }
      format.json { head :no_content }
    end
  end
end
