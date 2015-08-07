class BoneSymmetriesController < ApplicationController
  # GET /bone_symmetries
  # GET /bone_symmetries.json
  def index
    @bone_symmetries = BoneSymmetry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_symmetries }
    end
  end

  # GET /bone_symmetries/1
  # GET /bone_symmetries/1.json
  def show
    @bone_symmetry = BoneSymmetry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_symmetry }
    end
  end

  # GET /bone_symmetries/new
  # GET /bone_symmetries/new.json
  def new
    @bone_symmetry = BoneSymmetry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_symmetry }
    end
  end

  # GET /bone_symmetries/1/edit
  def edit
    @bone_symmetry = BoneSymmetry.find(params[:id])
  end

  # POST /bone_symmetries
  # POST /bone_symmetries.json
  def create
    @bone_symmetry = BoneSymmetry.new(params[:bone_symmetry])

    respond_to do |format|
      if @bone_symmetry.save
        format.html { redirect_to @bone_symmetry, notice: 'Bone symmetry was successfully created.' }
        format.json { render json: @bone_symmetry, status: :created, location: @bone_symmetry }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_symmetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_symmetries/1
  # PUT /bone_symmetries/1.json
  def update
    @bone_symmetry = BoneSymmetry.find(params[:id])

    respond_to do |format|
      if @bone_symmetry.update_attributes(params[:bone_symmetry])
        format.html { redirect_to @bone_symmetry, notice: 'Bone symmetry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_symmetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_symmetries/1
  # DELETE /bone_symmetries/1.json
  def destroy
    @bone_symmetry = BoneSymmetry.find(params[:id])
    @bone_symmetry.destroy

    respond_to do |format|
      format.html { redirect_to bone_symmetries_url }
      format.json { head :no_content }
    end
  end
end
