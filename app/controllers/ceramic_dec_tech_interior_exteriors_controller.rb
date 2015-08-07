class CeramicDecTechInteriorExteriorsController < ApplicationController
  # GET /ceramic_dec_tech_interior_exteriors
  # GET /ceramic_dec_tech_interior_exteriors.json
  def index
    @ceramic_dec_tech_interior_exteriors = CeramicDecTechInteriorExterior.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_dec_tech_interior_exteriors }
    end
  end

  # GET /ceramic_dec_tech_interior_exteriors/1
  # GET /ceramic_dec_tech_interior_exteriors/1.json
  def show
    @ceramic_dec_tech_interior_exterior = CeramicDecTechInteriorExterior.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_dec_tech_interior_exterior }
    end
  end

  # GET /ceramic_dec_tech_interior_exteriors/new
  # GET /ceramic_dec_tech_interior_exteriors/new.json
  def new
    @ceramic_dec_tech_interior_exterior = CeramicDecTechInteriorExterior.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_dec_tech_interior_exterior }
    end
  end

  # GET /ceramic_dec_tech_interior_exteriors/1/edit
  def edit
    @ceramic_dec_tech_interior_exterior = CeramicDecTechInteriorExterior.find(params[:id])
  end

  # POST /ceramic_dec_tech_interior_exteriors
  # POST /ceramic_dec_tech_interior_exteriors.json
  def create
    @ceramic_dec_tech_interior_exterior = CeramicDecTechInteriorExterior.new(params[:ceramic_dec_tech_interior_exterior])

    respond_to do |format|
      if @ceramic_dec_tech_interior_exterior.save
        format.html { redirect_to @ceramic_dec_tech_interior_exterior, notice: 'Ceramic dec tech interior exterior was successfully created.' }
        format.json { render json: @ceramic_dec_tech_interior_exterior, status: :created, location: @ceramic_dec_tech_interior_exterior }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_dec_tech_interior_exterior.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_dec_tech_interior_exteriors/1
  # PUT /ceramic_dec_tech_interior_exteriors/1.json
  def update
    @ceramic_dec_tech_interior_exterior = CeramicDecTechInteriorExterior.find(params[:id])

    respond_to do |format|
      if @ceramic_dec_tech_interior_exterior.update_attributes(params[:ceramic_dec_tech_interior_exterior])
        format.html { redirect_to @ceramic_dec_tech_interior_exterior, notice: 'Ceramic dec tech interior exterior was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_dec_tech_interior_exterior.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_dec_tech_interior_exteriors/1
  # DELETE /ceramic_dec_tech_interior_exteriors/1.json
  def destroy
    @ceramic_dec_tech_interior_exterior = CeramicDecTechInteriorExterior.find(params[:id])
    @ceramic_dec_tech_interior_exterior.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_dec_tech_interior_exteriors_url }
      format.json { head :no_content }
    end
  end
end
