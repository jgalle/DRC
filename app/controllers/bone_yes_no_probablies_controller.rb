class BoneYesNoProbabliesController < ApplicationController
  # GET /bone_yes_no_probablies
  # GET /bone_yes_no_probablies.json
  def index
    @bone_yes_no_probablies = BoneYesNoProbably.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_yes_no_probablies }
    end
  end

  # GET /bone_yes_no_probablies/1
  # GET /bone_yes_no_probablies/1.json
  def show
    @bone_yes_no_probably = BoneYesNoProbably.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_yes_no_probably }
    end
  end

  # GET /bone_yes_no_probablies/new
  # GET /bone_yes_no_probablies/new.json
  def new
    @bone_yes_no_probably = BoneYesNoProbably.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_yes_no_probably }
    end
  end

  # GET /bone_yes_no_probablies/1/edit
  def edit
    @bone_yes_no_probably = BoneYesNoProbably.find(params[:id])
  end

  # POST /bone_yes_no_probablies
  # POST /bone_yes_no_probablies.json
  def create
    @bone_yes_no_probably = BoneYesNoProbably.new(params[:bone_yes_no_probably])

    respond_to do |format|
      if @bone_yes_no_probably.save
        format.html { redirect_to @bone_yes_no_probably, notice: 'Bone yes no probably was successfully created.' }
        format.json { render json: @bone_yes_no_probably, status: :created, location: @bone_yes_no_probably }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_yes_no_probably.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_yes_no_probablies/1
  # PUT /bone_yes_no_probablies/1.json
  def update
    @bone_yes_no_probably = BoneYesNoProbably.find(params[:id])

    respond_to do |format|
      if @bone_yes_no_probably.update_attributes(params[:bone_yes_no_probably])
        format.html { redirect_to @bone_yes_no_probably, notice: 'Bone yes no probably was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_yes_no_probably.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_yes_no_probablies/1
  # DELETE /bone_yes_no_probablies/1.json
  def destroy
    @bone_yes_no_probably = BoneYesNoProbably.find(params[:id])
    @bone_yes_no_probably.destroy

    respond_to do |format|
      format.html { redirect_to bone_yes_no_probablies_url }
      format.json { head :no_content }
    end
  end
end
