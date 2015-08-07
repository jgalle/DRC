class BoneToothWearsController < ApplicationController
  # GET /bone_tooth_wears
  # GET /bone_tooth_wears.json
  def index
    @bone_tooth_wears = BoneToothWear.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_tooth_wears }
    end
  end

  # GET /bone_tooth_wears/1
  # GET /bone_tooth_wears/1.json
  def show
    @bone_tooth_wear = BoneToothWear.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_tooth_wear }
    end
  end

  # GET /bone_tooth_wears/new
  # GET /bone_tooth_wears/new.json
  def new
    @bone_tooth_wear = BoneToothWear.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_tooth_wear }
    end
  end

  # GET /bone_tooth_wears/1/edit
  def edit
    @bone_tooth_wear = BoneToothWear.find(params[:id])
  end

  # POST /bone_tooth_wears
  # POST /bone_tooth_wears.json
  def create
    @bone_tooth_wear = BoneToothWear.new(params[:bone_tooth_wear])

    respond_to do |format|
      if @bone_tooth_wear.save
        format.html { redirect_to @bone_tooth_wear, notice: 'Bone tooth wear was successfully created.' }
        format.json { render json: @bone_tooth_wear, status: :created, location: @bone_tooth_wear }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_tooth_wear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_tooth_wears/1
  # PUT /bone_tooth_wears/1.json
  def update
    @bone_tooth_wear = BoneToothWear.find(params[:id])

    respond_to do |format|
      if @bone_tooth_wear.update_attributes(params[:bone_tooth_wear])
        format.html { redirect_to @bone_tooth_wear, notice: 'Bone tooth wear was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_tooth_wear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_tooth_wears/1
  # DELETE /bone_tooth_wears/1.json
  def destroy
    @bone_tooth_wear = BoneToothWear.find(params[:id])
    @bone_tooth_wear.destroy

    respond_to do |format|
      format.html { redirect_to bone_tooth_wears_url }
      format.json { head :no_content }
    end
  end
end
