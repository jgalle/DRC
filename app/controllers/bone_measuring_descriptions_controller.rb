class BoneMeasuringDescriptionsController < ApplicationController
  # GET /bone_measuring_descriptions
  # GET /bone_measuring_descriptions.json
  def index
    @bone_measuring_descriptions = BoneMeasuringDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_measuring_descriptions }
    end
  end

  # GET /bone_measuring_descriptions/1
  # GET /bone_measuring_descriptions/1.json
  def show
    @bone_measuring_description = BoneMeasuringDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_measuring_description }
    end
  end

  # GET /bone_measuring_descriptions/new
  # GET /bone_measuring_descriptions/new.json
  def new
    @bone_measuring_description = BoneMeasuringDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_measuring_description }
    end
  end

  # GET /bone_measuring_descriptions/1/edit
  def edit
    @bone_measuring_description = BoneMeasuringDescription.find(params[:id])
  end

  # POST /bone_measuring_descriptions
  # POST /bone_measuring_descriptions.json
  def create
    @bone_measuring_description = BoneMeasuringDescription.new(params[:bone_measuring_description])

    respond_to do |format|
      if @bone_measuring_description.save
        format.html { redirect_to @bone_measuring_description, notice: 'Bone measuring description was successfully created.' }
        format.json { render json: @bone_measuring_description, status: :created, location: @bone_measuring_description }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_measuring_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_measuring_descriptions/1
  # PUT /bone_measuring_descriptions/1.json
  def update
    @bone_measuring_description = BoneMeasuringDescription.find(params[:id])

    respond_to do |format|
      if @bone_measuring_description.update_attributes(params[:bone_measuring_description])
        format.html { redirect_to @bone_measuring_description, notice: 'Bone measuring description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_measuring_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_measuring_descriptions/1
  # DELETE /bone_measuring_descriptions/1.json
  def destroy
    @bone_measuring_description = BoneMeasuringDescription.find(params[:id])
    @bone_measuring_description.destroy

    respond_to do |format|
      format.html { redirect_to bone_measuring_descriptions_url }
      format.json { head :no_content }
    end
  end
end
