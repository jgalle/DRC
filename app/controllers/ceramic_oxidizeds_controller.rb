class CeramicOxidizedsController < ApplicationController
  # GET /ceramic_oxidizeds
  # GET /ceramic_oxidizeds.json
  def index
    @ceramic_oxidizeds = CeramicOxidized.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_oxidizeds }
    end
  end

  # GET /ceramic_oxidizeds/1
  # GET /ceramic_oxidizeds/1.json
  def show
    @ceramic_oxidized = CeramicOxidized.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_oxidized }
    end
  end

  # GET /ceramic_oxidizeds/new
  # GET /ceramic_oxidizeds/new.json
  def new
    @ceramic_oxidized = CeramicOxidized.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_oxidized }
    end
  end

  # GET /ceramic_oxidizeds/1/edit
  def edit
    @ceramic_oxidized = CeramicOxidized.find(params[:id])
  end

  # POST /ceramic_oxidizeds
  # POST /ceramic_oxidizeds.json
  def create
    @ceramic_oxidized = CeramicOxidized.new(params[:ceramic_oxidized])

    respond_to do |format|
      if @ceramic_oxidized.save
        format.html { redirect_to @ceramic_oxidized, notice: 'Ceramic oxidized was successfully created.' }
        format.json { render json: @ceramic_oxidized, status: :created, location: @ceramic_oxidized }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_oxidized.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_oxidizeds/1
  # PUT /ceramic_oxidizeds/1.json
  def update
    @ceramic_oxidized = CeramicOxidized.find(params[:id])

    respond_to do |format|
      if @ceramic_oxidized.update_attributes(params[:ceramic_oxidized])
        format.html { redirect_to @ceramic_oxidized, notice: 'Ceramic oxidized was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_oxidized.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_oxidizeds/1
  # DELETE /ceramic_oxidizeds/1.json
  def destroy
    @ceramic_oxidized = CeramicOxidized.find(params[:id])
    @ceramic_oxidized.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_oxidizeds_url }
      format.json { head :no_content }
    end
  end
end
