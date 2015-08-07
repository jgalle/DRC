class BoneToothTypesController < ApplicationController
  # GET /bone_tooth_types
  # GET /bone_tooth_types.json
  def index
    @bone_tooth_types = BoneToothType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_tooth_types }
    end
  end

  # GET /bone_tooth_types/1
  # GET /bone_tooth_types/1.json
  def show
    @bone_tooth_type = BoneToothType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_tooth_type }
    end
  end

  # GET /bone_tooth_types/new
  # GET /bone_tooth_types/new.json
  def new
    @bone_tooth_type = BoneToothType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_tooth_type }
    end
  end

  # GET /bone_tooth_types/1/edit
  def edit
    @bone_tooth_type = BoneToothType.find(params[:id])
  end

  # POST /bone_tooth_types
  # POST /bone_tooth_types.json
  def create
    @bone_tooth_type = BoneToothType.new(params[:bone_tooth_type])

    respond_to do |format|
      if @bone_tooth_type.save
        format.html { redirect_to @bone_tooth_type, notice: 'Bone tooth type was successfully created.' }
        format.json { render json: @bone_tooth_type, status: :created, location: @bone_tooth_type }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_tooth_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_tooth_types/1
  # PUT /bone_tooth_types/1.json
  def update
    @bone_tooth_type = BoneToothType.find(params[:id])

    respond_to do |format|
      if @bone_tooth_type.update_attributes(params[:bone_tooth_type])
        format.html { redirect_to @bone_tooth_type, notice: 'Bone tooth type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_tooth_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_tooth_types/1
  # DELETE /bone_tooth_types/1.json
  def destroy
    @bone_tooth_type = BoneToothType.find(params[:id])
    @bone_tooth_type.destroy

    respond_to do |format|
      format.html { redirect_to bone_tooth_types_url }
      format.json { head :no_content }
    end
  end
end
