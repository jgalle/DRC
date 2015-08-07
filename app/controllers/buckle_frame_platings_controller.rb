class BuckleFramePlatingsController < ApplicationController
  # GET /buckle_frame_platings
  # GET /buckle_frame_platings.json
  def index
    @buckle_frame_platings = BuckleFramePlating.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_frame_platings }
    end
  end

  # GET /buckle_frame_platings/1
  # GET /buckle_frame_platings/1.json
  def show
    @buckle_frame_plating = BuckleFramePlating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_frame_plating }
    end
  end

  # GET /buckle_frame_platings/new
  # GET /buckle_frame_platings/new.json
  def new
    @buckle_frame_plating = BuckleFramePlating.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_frame_plating }
    end
  end

  # GET /buckle_frame_platings/1/edit
  def edit
    @buckle_frame_plating = BuckleFramePlating.find(params[:id])
  end

  # POST /buckle_frame_platings
  # POST /buckle_frame_platings.json
  def create
    @buckle_frame_plating = BuckleFramePlating.new(params[:buckle_frame_plating])

    respond_to do |format|
      if @buckle_frame_plating.save
        format.html { redirect_to @buckle_frame_plating, notice: 'Buckle frame plating was successfully created.' }
        format.json { render json: @buckle_frame_plating, status: :created, location: @buckle_frame_plating }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_frame_plating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_frame_platings/1
  # PUT /buckle_frame_platings/1.json
  def update
    @buckle_frame_plating = BuckleFramePlating.find(params[:id])

    respond_to do |format|
      if @buckle_frame_plating.update_attributes(params[:buckle_frame_plating])
        format.html { redirect_to @buckle_frame_plating, notice: 'Buckle frame plating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_frame_plating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_frame_platings/1
  # DELETE /buckle_frame_platings/1.json
  def destroy
    @buckle_frame_plating = BuckleFramePlating.find(params[:id])
    @buckle_frame_plating.destroy

    respond_to do |format|
      format.html { redirect_to buckle_frame_platings_url }
      format.json { head :no_content }
    end
  end
end
