class BuckleDecTechTypesController < ApplicationController
  # GET /buckle_dec_tech_types
  # GET /buckle_dec_tech_types.json
  def index
    @buckle_dec_tech_types = BuckleDecTechType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_dec_tech_types }
    end
  end

  # GET /buckle_dec_tech_types/1
  # GET /buckle_dec_tech_types/1.json
  def show
    @buckle_dec_tech_type = BuckleDecTechType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_dec_tech_type }
    end
  end

  # GET /buckle_dec_tech_types/new
  # GET /buckle_dec_tech_types/new.json
  def new
    @buckle_dec_tech_type = BuckleDecTechType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_dec_tech_type }
    end
  end

  # GET /buckle_dec_tech_types/1/edit
  def edit
    @buckle_dec_tech_type = BuckleDecTechType.find(params[:id])
  end

  # POST /buckle_dec_tech_types
  # POST /buckle_dec_tech_types.json
  def create
    @buckle_dec_tech_type = BuckleDecTechType.new(params[:buckle_dec_tech_type])

    respond_to do |format|
      if @buckle_dec_tech_type.save
        format.html { redirect_to @buckle_dec_tech_type, notice: 'Buckle dec tech type was successfully created.' }
        format.json { render json: @buckle_dec_tech_type, status: :created, location: @buckle_dec_tech_type }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_dec_tech_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_dec_tech_types/1
  # PUT /buckle_dec_tech_types/1.json
  def update
    @buckle_dec_tech_type = BuckleDecTechType.find(params[:id])

    respond_to do |format|
      if @buckle_dec_tech_type.update_attributes(params[:buckle_dec_tech_type])
        format.html { redirect_to @buckle_dec_tech_type, notice: 'Buckle dec tech type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_dec_tech_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_dec_tech_types/1
  # DELETE /buckle_dec_tech_types/1.json
  def destroy
    @buckle_dec_tech_type = BuckleDecTechType.find(params[:id])
    @buckle_dec_tech_type.destroy

    respond_to do |format|
      format.html { redirect_to buckle_dec_tech_types_url }
      format.json { head :no_content }
    end
  end
end
