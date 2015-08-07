class BoneMarkTypesController < ApplicationController
  # GET /bone_mark_types
  # GET /bone_mark_types.json
  def index
    @bone_mark_types = BoneMarkType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_mark_types }
    end
  end

  # GET /bone_mark_types/1
  # GET /bone_mark_types/1.json
  def show
    @bone_mark_type = BoneMarkType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_mark_type }
    end
  end

  # GET /bone_mark_types/new
  # GET /bone_mark_types/new.json
  def new
    @bone_mark_type = BoneMarkType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_mark_type }
    end
  end

  # GET /bone_mark_types/1/edit
  def edit
    @bone_mark_type = BoneMarkType.find(params[:id])
  end

  # POST /bone_mark_types
  # POST /bone_mark_types.json
  def create
    @bone_mark_type = BoneMarkType.new(params[:bone_mark_type])

    respond_to do |format|
      if @bone_mark_type.save
        format.html { redirect_to @bone_mark_type, notice: 'Bone mark type was successfully created.' }
        format.json { render json: @bone_mark_type, status: :created, location: @bone_mark_type }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_mark_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_mark_types/1
  # PUT /bone_mark_types/1.json
  def update
    @bone_mark_type = BoneMarkType.find(params[:id])

    respond_to do |format|
      if @bone_mark_type.update_attributes(params[:bone_mark_type])
        format.html { redirect_to @bone_mark_type, notice: 'Bone mark type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_mark_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_mark_types/1
  # DELETE /bone_mark_types/1.json
  def destroy
    @bone_mark_type = BoneMarkType.find(params[:id])
    @bone_mark_type.destroy

    respond_to do |format|
      format.html { redirect_to bone_mark_types_url }
      format.json { head :no_content }
    end
  end
end
