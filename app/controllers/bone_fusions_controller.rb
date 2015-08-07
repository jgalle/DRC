class BoneFusionsController < ApplicationController
  # GET /bone_fusions
  # GET /bone_fusions.json
  def index
    @bone_fusions = BoneFusion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_fusions }
    end
  end

  # GET /bone_fusions/1
  # GET /bone_fusions/1.json
  def show
    @bone_fusion = BoneFusion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_fusion }
    end
  end

  # GET /bone_fusions/new
  # GET /bone_fusions/new.json
  def new
    @bone_fusion = BoneFusion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_fusion }
    end
  end

  # GET /bone_fusions/1/edit
  def edit
    @bone_fusion = BoneFusion.find(params[:id])
  end

  # POST /bone_fusions
  # POST /bone_fusions.json
  def create
    @bone_fusion = BoneFusion.new(params[:bone_fusion])

    respond_to do |format|
      if @bone_fusion.save
        format.html { redirect_to @bone_fusion, notice: 'Bone fusion was successfully created.' }
        format.json { render json: @bone_fusion, status: :created, location: @bone_fusion }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_fusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_fusions/1
  # PUT /bone_fusions/1.json
  def update
    @bone_fusion = BoneFusion.find(params[:id])

    respond_to do |format|
      if @bone_fusion.update_attributes(params[:bone_fusion])
        format.html { redirect_to @bone_fusion, notice: 'Bone fusion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_fusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_fusions/1
  # DELETE /bone_fusions/1.json
  def destroy
    @bone_fusion = BoneFusion.find(params[:id])
    @bone_fusion.destroy

    respond_to do |format|
      format.html { redirect_to bone_fusions_url }
      format.json { head :no_content }
    end
  end
end
