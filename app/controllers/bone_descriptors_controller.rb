class BoneDescriptorsController < ApplicationController
  # GET /bone_descriptors
  # GET /bone_descriptors.json
  def index
    @bone_descriptors = BoneDescriptor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_descriptors }
    end
  end

  # GET /bone_descriptors/1
  # GET /bone_descriptors/1.json
  def show
    @bone_descriptor = BoneDescriptor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_descriptor }
    end
  end

  # GET /bone_descriptors/new
  # GET /bone_descriptors/new.json
  def new
    @bone_descriptor = BoneDescriptor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_descriptor }
    end
  end

  # GET /bone_descriptors/1/edit
  def edit
    @bone_descriptor = BoneDescriptor.find(params[:id])
  end

  # POST /bone_descriptors
  # POST /bone_descriptors.json
  def create
    @bone_descriptor = BoneDescriptor.new(params[:bone_descriptor])

    respond_to do |format|
      if @bone_descriptor.save
        format.html { redirect_to @bone_descriptor, notice: 'Bone descriptor was successfully created.' }
        format.json { render json: @bone_descriptor, status: :created, location: @bone_descriptor }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_descriptors/1
  # PUT /bone_descriptors/1.json
  def update
    @bone_descriptor = BoneDescriptor.find(params[:id])

    respond_to do |format|
      if @bone_descriptor.update_attributes(params[:bone_descriptor])
        format.html { redirect_to @bone_descriptor, notice: 'Bone descriptor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_descriptors/1
  # DELETE /bone_descriptors/1.json
  def destroy
    @bone_descriptor = BoneDescriptor.find(params[:id])
    @bone_descriptor.destroy

    respond_to do |format|
      format.html { redirect_to bone_descriptors_url }
      format.json { head :no_content }
    end
  end
end
