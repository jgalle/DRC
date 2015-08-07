class CeramicRimAnglesController < ApplicationController
  # GET /ceramic_rim_angles
  # GET /ceramic_rim_angles.json
  def index
    @ceramic_rim_angles = CeramicRimAngle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_rim_angles }
    end
  end

  # GET /ceramic_rim_angles/1
  # GET /ceramic_rim_angles/1.json
  def show
    @ceramic_rim_angle = CeramicRimAngle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_rim_angle }
    end
  end

  # GET /ceramic_rim_angles/new
  # GET /ceramic_rim_angles/new.json
  def new
    @ceramic_rim_angle = CeramicRimAngle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_rim_angle }
    end
  end

  # GET /ceramic_rim_angles/1/edit
  def edit
    @ceramic_rim_angle = CeramicRimAngle.find(params[:id])
  end

  # POST /ceramic_rim_angles
  # POST /ceramic_rim_angles.json
  def create
    @ceramic_rim_angle = CeramicRimAngle.new(params[:ceramic_rim_angle])

    respond_to do |format|
      if @ceramic_rim_angle.save
        format.html { redirect_to @ceramic_rim_angle, notice: 'Ceramic rim angle was successfully created.' }
        format.json { render json: @ceramic_rim_angle, status: :created, location: @ceramic_rim_angle }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_rim_angle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_rim_angles/1
  # PUT /ceramic_rim_angles/1.json
  def update
    @ceramic_rim_angle = CeramicRimAngle.find(params[:id])

    respond_to do |format|
      if @ceramic_rim_angle.update_attributes(params[:ceramic_rim_angle])
        format.html { redirect_to @ceramic_rim_angle, notice: 'Ceramic rim angle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_rim_angle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_rim_angles/1
  # DELETE /ceramic_rim_angles/1.json
  def destroy
    @ceramic_rim_angle = CeramicRimAngle.find(params[:id])
    @ceramic_rim_angle.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_rim_angles_url }
      format.json { head :no_content }
    end
  end
end
