class CeramicGlazesController < ApplicationController
  # GET /ceramic_glazes
  # GET /ceramic_glazes.json
  def index
    @ceramic_glazes = CeramicGlaze.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_glazes }
    end
  end

  # GET /ceramic_glazes/1
  # GET /ceramic_glazes/1.json
  def show
    @ceramic_glaze = CeramicGlaze.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_glaze }
    end
  end

  # GET /ceramic_glazes/new
  # GET /ceramic_glazes/new.json
  def new
    @ceramic_glaze = CeramicGlaze.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_glaze }
    end
  end

  # GET /ceramic_glazes/1/edit
  def edit
    @ceramic_glaze = CeramicGlaze.find(params[:id])
  end

  # POST /ceramic_glazes
  # POST /ceramic_glazes.json
  def create
    @ceramic_glaze = CeramicGlaze.new(params[:ceramic_glaze])

    respond_to do |format|
      if @ceramic_glaze.save
        format.html { redirect_to @ceramic_glaze, notice: 'Ceramic glaze was successfully created.' }
        format.json { render json: @ceramic_glaze, status: :created, location: @ceramic_glaze }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_glaze.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_glazes/1
  # PUT /ceramic_glazes/1.json
  def update
    @ceramic_glaze = CeramicGlaze.find(params[:id])

    respond_to do |format|
      if @ceramic_glaze.update_attributes(params[:ceramic_glaze])
        format.html { redirect_to @ceramic_glaze, notice: 'Ceramic glaze was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_glaze.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_glazes/1
  # DELETE /ceramic_glazes/1.json
  def destroy
    @ceramic_glaze = CeramicGlaze.find(params[:id])
    @ceramic_glaze.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_glazes_url }
      format.json { head :no_content }
    end
  end
end
