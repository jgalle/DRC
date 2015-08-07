class BoneElementsController < ApplicationController
  # GET /bone_elements
  # GET /bone_elements.json
  def index
    @bone_elements = BoneElement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_elements }
    end
  end

  # GET /bone_elements/1
  # GET /bone_elements/1.json
  def show
    @bone_element = BoneElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_element }
    end
  end

  # GET /bone_elements/new
  # GET /bone_elements/new.json
  def new
    @bone_element = BoneElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_element }
    end
  end

  # GET /bone_elements/1/edit
  def edit
    @bone_element = BoneElement.find(params[:id])
  end

  # POST /bone_elements
  # POST /bone_elements.json
  def create
    @bone_element = BoneElement.new(params[:bone_element])

    respond_to do |format|
      if @bone_element.save
        format.html { redirect_to @bone_element, notice: 'Bone element was successfully created.' }
        format.json { render json: @bone_element, status: :created, location: @bone_element }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_elements/1
  # PUT /bone_elements/1.json
  def update
    @bone_element = BoneElement.find(params[:id])

    respond_to do |format|
      if @bone_element.update_attributes(params[:bone_element])
        format.html { redirect_to @bone_element, notice: 'Bone element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_elements/1
  # DELETE /bone_elements/1.json
  def destroy
    @bone_element = BoneElement.find(params[:id])
    @bone_element.destroy

    respond_to do |format|
      format.html { redirect_to bone_elements_url }
      format.json { head :no_content }
    end
  end
end
