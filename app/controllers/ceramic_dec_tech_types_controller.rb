class CeramicDecTechTypesController < ApplicationController
  # GET /ceramic_dec_tech_types
  # GET /ceramic_dec_tech_types.json
  def index
    @ceramic_dec_tech_types = CeramicDecTechType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_dec_tech_types }
    end
  end

  # GET /ceramic_dec_tech_types/1
  # GET /ceramic_dec_tech_types/1.json
  def show
    @ceramic_dec_tech_type = CeramicDecTechType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_dec_tech_type }
    end
  end

  # GET /ceramic_dec_tech_types/new
  # GET /ceramic_dec_tech_types/new.json
  def new
    @ceramic_dec_tech_type = CeramicDecTechType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_dec_tech_type }
    end
  end

  # GET /ceramic_dec_tech_types/1/edit
  def edit
    @ceramic_dec_tech_type = CeramicDecTechType.find(params[:id])
  end

  # POST /ceramic_dec_tech_types
  # POST /ceramic_dec_tech_types.json
  def create
    @ceramic_dec_tech_type = CeramicDecTechType.new(params[:ceramic_dec_tech_type])

    respond_to do |format|
      if @ceramic_dec_tech_type.save
        format.html { redirect_to @ceramic_dec_tech_type, notice: 'Ceramic dec tech type was successfully created.' }
        format.json { render json: @ceramic_dec_tech_type, status: :created, location: @ceramic_dec_tech_type }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_dec_tech_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_dec_tech_types/1
  # PUT /ceramic_dec_tech_types/1.json
  def update
    @ceramic_dec_tech_type = CeramicDecTechType.find(params[:id])

    respond_to do |format|
      if @ceramic_dec_tech_type.update_attributes(params[:ceramic_dec_tech_type])
        format.html { redirect_to @ceramic_dec_tech_type, notice: 'Ceramic dec tech type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_dec_tech_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_dec_tech_types/1
  # DELETE /ceramic_dec_tech_types/1.json
  def destroy
    @ceramic_dec_tech_type = CeramicDecTechType.find(params[:id])
    @ceramic_dec_tech_type.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_dec_tech_types_url }
      format.json { head :no_content }
    end
  end
end
