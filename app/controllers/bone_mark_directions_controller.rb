class BoneMarkDirectionsController < ApplicationController
  # GET /bone_mark_directions
  # GET /bone_mark_directions.json
  def index
    @bone_mark_directions = BoneMarkDirection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_mark_directions }
    end
  end

  # GET /bone_mark_directions/1
  # GET /bone_mark_directions/1.json
  def show
    @bone_mark_direction = BoneMarkDirection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_mark_direction }
    end
  end

  # GET /bone_mark_directions/new
  # GET /bone_mark_directions/new.json
  def new
    @bone_mark_direction = BoneMarkDirection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_mark_direction }
    end
  end

  # GET /bone_mark_directions/1/edit
  def edit
    @bone_mark_direction = BoneMarkDirection.find(params[:id])
  end

  # POST /bone_mark_directions
  # POST /bone_mark_directions.json
  def create
    @bone_mark_direction = BoneMarkDirection.new(params[:bone_mark_direction])

    respond_to do |format|
      if @bone_mark_direction.save
        format.html { redirect_to @bone_mark_direction, notice: 'Bone mark direction was successfully created.' }
        format.json { render json: @bone_mark_direction, status: :created, location: @bone_mark_direction }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_mark_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_mark_directions/1
  # PUT /bone_mark_directions/1.json
  def update
    @bone_mark_direction = BoneMarkDirection.find(params[:id])

    respond_to do |format|
      if @bone_mark_direction.update_attributes(params[:bone_mark_direction])
        format.html { redirect_to @bone_mark_direction, notice: 'Bone mark direction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_mark_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_mark_directions/1
  # DELETE /bone_mark_directions/1.json
  def destroy
    @bone_mark_direction = BoneMarkDirection.find(params[:id])
    @bone_mark_direction.destroy

    respond_to do |format|
      format.html { redirect_to bone_mark_directions_url }
      format.json { head :no_content }
    end
  end
end
