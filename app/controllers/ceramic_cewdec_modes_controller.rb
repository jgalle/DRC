class CeramicCewdecModesController < ApplicationController
  # GET /ceramic_cewdec_modes
  # GET /ceramic_cewdec_modes.json
  def index
    @ceramic_cewdec_modes = CeramicCewdecMode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_cewdec_modes }
    end
  end

  # GET /ceramic_cewdec_modes/1
  # GET /ceramic_cewdec_modes/1.json
  def show
    @ceramic_cewdec_mode = CeramicCewdecMode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_cewdec_mode }
    end
  end

  # GET /ceramic_cewdec_modes/new
  # GET /ceramic_cewdec_modes/new.json
  def new
    @ceramic_cewdec_mode = CeramicCewdecMode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_cewdec_mode }
    end
  end

  # GET /ceramic_cewdec_modes/1/edit
  def edit
    @ceramic_cewdec_mode = CeramicCewdecMode.find(params[:id])
  end

  # POST /ceramic_cewdec_modes
  # POST /ceramic_cewdec_modes.json
  def create
    @ceramic_cewdec_mode = CeramicCewdecMode.new(params[:ceramic_cewdec_mode])

    respond_to do |format|
      if @ceramic_cewdec_mode.save
        format.html { redirect_to @ceramic_cewdec_mode, notice: 'Ceramic cewdec mode was successfully created.' }
        format.json { render json: @ceramic_cewdec_mode, status: :created, location: @ceramic_cewdec_mode }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_cewdec_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_cewdec_modes/1
  # PUT /ceramic_cewdec_modes/1.json
  def update
    @ceramic_cewdec_mode = CeramicCewdecMode.find(params[:id])

    respond_to do |format|
      if @ceramic_cewdec_mode.update_attributes(params[:ceramic_cewdec_mode])
        format.html { redirect_to @ceramic_cewdec_mode, notice: 'Ceramic cewdec mode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_cewdec_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_cewdec_modes/1
  # DELETE /ceramic_cewdec_modes/1.json
  def destroy
    @ceramic_cewdec_mode = CeramicCewdecMode.find(params[:id])
    @ceramic_cewdec_mode.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_cewdec_modes_url }
      format.json { head :no_content }
    end
  end
end
