class BoneChewTypesController < ApplicationController
  # GET /bone_chew_types
  # GET /bone_chew_types.json
  def index
    @bone_chew_types = BoneChewType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_chew_types }
    end
  end

  # GET /bone_chew_types/1
  # GET /bone_chew_types/1.json
  def show
    @bone_chew_type = BoneChewType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_chew_type }
    end
  end

  # GET /bone_chew_types/new
  # GET /bone_chew_types/new.json
  def new
    @bone_chew_type = BoneChewType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_chew_type }
    end
  end

  # GET /bone_chew_types/1/edit
  def edit
    @bone_chew_type = BoneChewType.find(params[:id])
  end

  # POST /bone_chew_types
  # POST /bone_chew_types.json
  def create
    @bone_chew_type = BoneChewType.new(params[:bone_chew_type])

    respond_to do |format|
      if @bone_chew_type.save
        format.html { redirect_to @bone_chew_type, notice: 'Bone chew type was successfully created.' }
        format.json { render json: @bone_chew_type, status: :created, location: @bone_chew_type }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_chew_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_chew_types/1
  # PUT /bone_chew_types/1.json
  def update
    @bone_chew_type = BoneChewType.find(params[:id])

    respond_to do |format|
      if @bone_chew_type.update_attributes(params[:bone_chew_type])
        format.html { redirect_to @bone_chew_type, notice: 'Bone chew type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_chew_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_chew_types/1
  # DELETE /bone_chew_types/1.json
  def destroy
    @bone_chew_type = BoneChewType.find(params[:id])
    @bone_chew_type.destroy

    respond_to do |format|
      format.html { redirect_to bone_chew_types_url }
      format.json { head :no_content }
    end
  end
end
