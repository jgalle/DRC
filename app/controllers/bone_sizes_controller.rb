class BoneSizesController < ApplicationController
  # GET /bone_sizes
  # GET /bone_sizes.json
  def index
    @bone_sizes = BoneSize.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_sizes }
    end
  end

  # GET /bone_sizes/1
  # GET /bone_sizes/1.json
  def show
    @bone_size = BoneSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_size }
    end
  end

  # GET /bone_sizes/new
  # GET /bone_sizes/new.json
  def new
    @bone_size = BoneSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_size }
    end
  end

  # GET /bone_sizes/1/edit
  def edit
    @bone_size = BoneSize.find(params[:id])
  end

  # POST /bone_sizes
  # POST /bone_sizes.json
  def create
    @bone_size = BoneSize.new(params[:bone_size])

    respond_to do |format|
      if @bone_size.save
        format.html { redirect_to @bone_size, notice: 'Bone size was successfully created.' }
        format.json { render json: @bone_size, status: :created, location: @bone_size }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_sizes/1
  # PUT /bone_sizes/1.json
  def update
    @bone_size = BoneSize.find(params[:id])

    respond_to do |format|
      if @bone_size.update_attributes(params[:bone_size])
        format.html { redirect_to @bone_size, notice: 'Bone size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_sizes/1
  # DELETE /bone_sizes/1.json
  def destroy
    @bone_size = BoneSize.find(params[:id])
    @bone_size.destroy

    respond_to do |format|
      format.html { redirect_to bone_sizes_url }
      format.json { head :no_content }
    end
  end
end
