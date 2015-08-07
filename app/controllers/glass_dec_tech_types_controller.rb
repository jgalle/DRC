class GlassDecTechTypesController < ApplicationController
  # GET /glass_dec_tech_types
  # GET /glass_dec_tech_types.json
  def index
    @glass_dec_tech_types = GlassDecTechType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_dec_tech_types }
    end
  end

  # GET /glass_dec_tech_types/1
  # GET /glass_dec_tech_types/1.json
  def show
    @glass_dec_tech_type = GlassDecTechType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_dec_tech_type }
    end
  end

  # GET /glass_dec_tech_types/new
  # GET /glass_dec_tech_types/new.json
  def new
    @glass_dec_tech_type = GlassDecTechType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_dec_tech_type }
    end
  end

  # GET /glass_dec_tech_types/1/edit
  def edit
    @glass_dec_tech_type = GlassDecTechType.find(params[:id])
  end

  # POST /glass_dec_tech_types
  # POST /glass_dec_tech_types.json
  def create
    @glass_dec_tech_type = GlassDecTechType.new(params[:glass_dec_tech_type])

    respond_to do |format|
      if @glass_dec_tech_type.save
        format.html { redirect_to @glass_dec_tech_type, notice: 'Glass dec tech type was successfully created.' }
        format.json { render json: @glass_dec_tech_type, status: :created, location: @glass_dec_tech_type }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_dec_tech_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_dec_tech_types/1
  # PUT /glass_dec_tech_types/1.json
  def update
    @glass_dec_tech_type = GlassDecTechType.find(params[:id])

    respond_to do |format|
      if @glass_dec_tech_type.update_attributes(params[:glass_dec_tech_type])
        format.html { redirect_to @glass_dec_tech_type, notice: 'Glass dec tech type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_dec_tech_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_dec_tech_types/1
  # DELETE /glass_dec_tech_types/1.json
  def destroy
    @glass_dec_tech_type = GlassDecTechType.find(params[:id])
    @glass_dec_tech_type.destroy

    respond_to do |format|
      format.html { redirect_to glass_dec_tech_types_url }
      format.json { head :no_content }
    end
  end
end
