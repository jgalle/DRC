class BoneReliabilitiesController < ApplicationController
  # GET /bone_reliabilities
  # GET /bone_reliabilities.json
  def index
    @bone_reliabilities = BoneReliability.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_reliabilities }
    end
  end

  # GET /bone_reliabilities/1
  # GET /bone_reliabilities/1.json
  def show
    @bone_reliability = BoneReliability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_reliability }
    end
  end

  # GET /bone_reliabilities/new
  # GET /bone_reliabilities/new.json
  def new
    @bone_reliability = BoneReliability.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_reliability }
    end
  end

  # GET /bone_reliabilities/1/edit
  def edit
    @bone_reliability = BoneReliability.find(params[:id])
  end

  # POST /bone_reliabilities
  # POST /bone_reliabilities.json
  def create
    @bone_reliability = BoneReliability.new(params[:bone_reliability])

    respond_to do |format|
      if @bone_reliability.save
        format.html { redirect_to @bone_reliability, notice: 'Bone reliability was successfully created.' }
        format.json { render json: @bone_reliability, status: :created, location: @bone_reliability }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_reliability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_reliabilities/1
  # PUT /bone_reliabilities/1.json
  def update
    @bone_reliability = BoneReliability.find(params[:id])

    respond_to do |format|
      if @bone_reliability.update_attributes(params[:bone_reliability])
        format.html { redirect_to @bone_reliability, notice: 'Bone reliability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_reliability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_reliabilities/1
  # DELETE /bone_reliabilities/1.json
  def destroy
    @bone_reliability = BoneReliability.find(params[:id])
    @bone_reliability.destroy

    respond_to do |format|
      format.html { redirect_to bone_reliabilities_url }
      format.json { head :no_content }
    end
  end
end
