class CeramicCewtypesController < ApplicationController
  # GET /ceramic_cewtypes
  # GET /ceramic_cewtypes.json
  def index
    @ceramic_cewtypes = CeramicCewtype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_cewtypes }
    end
  end

  # GET /ceramic_cewtypes/1
  # GET /ceramic_cewtypes/1.json
  def show
    @ceramic_cewtype = CeramicCewtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_cewtype }
    end
  end

  # GET /ceramic_cewtypes/new
  # GET /ceramic_cewtypes/new.json
  def new
    @ceramic_cewtype = CeramicCewtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_cewtype }
    end
  end

  # GET /ceramic_cewtypes/1/edit
  def edit
    @ceramic_cewtype = CeramicCewtype.find(params[:id])
  end

  # POST /ceramic_cewtypes
  # POST /ceramic_cewtypes.json
  def create
    @ceramic_cewtype = CeramicCewtype.new(params[:ceramic_cewtype])

    respond_to do |format|
      if @ceramic_cewtype.save
        format.html { redirect_to @ceramic_cewtype, notice: 'Ceramic cewtype was successfully created.' }
        format.json { render json: @ceramic_cewtype, status: :created, location: @ceramic_cewtype }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_cewtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_cewtypes/1
  # PUT /ceramic_cewtypes/1.json
  def update
    @ceramic_cewtype = CeramicCewtype.find(params[:id])

    respond_to do |format|
      if @ceramic_cewtype.update_attributes(params[:ceramic_cewtype])
        format.html { redirect_to @ceramic_cewtype, notice: 'Ceramic cewtype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_cewtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_cewtypes/1
  # DELETE /ceramic_cewtypes/1.json
  def destroy
    @ceramic_cewtype = CeramicCewtype.find(params[:id])
    @ceramic_cewtype.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_cewtypes_url }
      format.json { head :no_content }
    end
  end
end
