class CeramicDecTechesController < ApplicationController
  # GET /ceramic_dec_teches
  # GET /ceramic_dec_teches.json
  def index
    @ceramic_dec_teches = CeramicDecTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_dec_teches }
    end
  end

  # GET /ceramic_dec_teches/1
  # GET /ceramic_dec_teches/1.json
  def show
    @ceramic_dec_tech = CeramicDecTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_dec_tech }
    end
  end

  # GET /ceramic_dec_teches/new
  # GET /ceramic_dec_teches/new.json
  def new
    @ceramic_dec_tech = CeramicDecTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_dec_tech }
    end
  end

  # GET /ceramic_dec_teches/1/edit
  def edit
    @ceramic_dec_tech = CeramicDecTech.find(params[:id])
  end

  # POST /ceramic_dec_teches
  # POST /ceramic_dec_teches.json
  def create
    @ceramic_dec_tech = CeramicDecTech.new(params[:ceramic_dec_tech])

    respond_to do |format|
      if @ceramic_dec_tech.save
        format.html { redirect_to @ceramic_dec_tech, notice: 'Ceramic dec tech was successfully created.' }
        format.json { render json: @ceramic_dec_tech, status: :created, location: @ceramic_dec_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_dec_teches/1
  # PUT /ceramic_dec_teches/1.json
  def update
    @ceramic_dec_tech = CeramicDecTech.find(params[:id])

    respond_to do |format|
      if @ceramic_dec_tech.update_attributes(params[:ceramic_dec_tech])
        format.html { redirect_to @ceramic_dec_tech, notice: 'Ceramic dec tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_dec_teches/1
  # DELETE /ceramic_dec_teches/1.json
  def destroy
    @ceramic_dec_tech = CeramicDecTech.find(params[:id])
    @ceramic_dec_tech.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_dec_teches_url }
      format.json { head :no_content }
    end
  end
end
