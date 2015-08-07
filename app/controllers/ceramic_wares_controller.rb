class CeramicWaresController < ApplicationController
  # GET /ceramic_wares
  # GET /ceramic_wares.json
  def index
    @ceramic_wares = CeramicWare.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_wares }
    end
  end

  # GET /ceramic_wares/1
  # GET /ceramic_wares/1.json
  def show
    @ceramic_ware = CeramicWare.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_ware }
    end
  end

  # GET /ceramic_wares/new
  # GET /ceramic_wares/new.json
  def new
    @ceramic_ware = CeramicWare.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_ware }
    end
  end

  # GET /ceramic_wares/1/edit
  def edit
    @ceramic_ware = CeramicWare.find(params[:id])
  end

  # POST /ceramic_wares
  # POST /ceramic_wares.json
  def create
    @ceramic_ware = CeramicWare.new(params[:ceramic_ware])

    respond_to do |format|
      if @ceramic_ware.save
        format.html { redirect_to @ceramic_ware, notice: 'Ceramic ware was successfully created.' }
        format.json { render json: @ceramic_ware, status: :created, location: @ceramic_ware }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_ware.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_wares/1
  # PUT /ceramic_wares/1.json
  def update
    @ceramic_ware = CeramicWare.find(params[:id])

    respond_to do |format|
      if @ceramic_ware.update_attributes(params[:ceramic_ware])
        format.html { redirect_to @ceramic_ware, notice: 'Ceramic ware was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_ware.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_wares/1
  # DELETE /ceramic_wares/1.json
  def destroy
    @ceramic_ware = CeramicWare.find(params[:id])
    @ceramic_ware.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_wares_url }
      format.json { head :no_content }
    end
  end
end
