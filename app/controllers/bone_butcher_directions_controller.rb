class BoneButcherDirectionsController < ApplicationController
  # GET /bone_butcher_directions
  # GET /bone_butcher_directions.json
  def index
    @bone_butcher_directions = BoneButcherDirection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_butcher_directions }
    end
  end

  # GET /bone_butcher_directions/1
  # GET /bone_butcher_directions/1.json
  def show
    @bone_butcher_direction = BoneButcherDirection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_butcher_direction }
    end
  end

  # GET /bone_butcher_directions/new
  # GET /bone_butcher_directions/new.json
  def new
    @bone_butcher_direction = BoneButcherDirection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_butcher_direction }
    end
  end

  # GET /bone_butcher_directions/1/edit
  def edit
    @bone_butcher_direction = BoneButcherDirection.find(params[:id])
  end

  # POST /bone_butcher_directions
  # POST /bone_butcher_directions.json
  def create
    @bone_butcher_direction = BoneButcherDirection.new(params[:bone_butcher_direction])

    respond_to do |format|
      if @bone_butcher_direction.save
        format.html { redirect_to @bone_butcher_direction, notice: 'Bone butcher direction was successfully created.' }
        format.json { render json: @bone_butcher_direction, status: :created, location: @bone_butcher_direction }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_butcher_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_butcher_directions/1
  # PUT /bone_butcher_directions/1.json
  def update
    @bone_butcher_direction = BoneButcherDirection.find(params[:id])

    respond_to do |format|
      if @bone_butcher_direction.update_attributes(params[:bone_butcher_direction])
        format.html { redirect_to @bone_butcher_direction, notice: 'Bone butcher direction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_butcher_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_butcher_directions/1
  # DELETE /bone_butcher_directions/1.json
  def destroy
    @bone_butcher_direction = BoneButcherDirection.find(params[:id])
    @bone_butcher_direction.destroy

    respond_to do |format|
      format.html { redirect_to bone_butcher_directions_url }
      format.json { head :no_content }
    end
  end
end
