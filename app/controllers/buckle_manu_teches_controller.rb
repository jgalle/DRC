class BuckleManuTechesController < ApplicationController
  # GET /buckle_manu_teches
  # GET /buckle_manu_teches.json
  def index
    @buckle_manu_teches = BuckleManuTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_manu_teches }
    end
  end

  # GET /buckle_manu_teches/1
  # GET /buckle_manu_teches/1.json
  def show
    @buckle_manu_tech = BuckleManuTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_manu_tech }
    end
  end

  # GET /buckle_manu_teches/new
  # GET /buckle_manu_teches/new.json
  def new
    @buckle_manu_tech = BuckleManuTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_manu_tech }
    end
  end

  # GET /buckle_manu_teches/1/edit
  def edit
    @buckle_manu_tech = BuckleManuTech.find(params[:id])
  end

  # POST /buckle_manu_teches
  # POST /buckle_manu_teches.json
  def create
    @buckle_manu_tech = BuckleManuTech.new(params[:buckle_manu_tech])

    respond_to do |format|
      if @buckle_manu_tech.save
        format.html { redirect_to @buckle_manu_tech, notice: 'Buckle manu tech was successfully created.' }
        format.json { render json: @buckle_manu_tech, status: :created, location: @buckle_manu_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_manu_teches/1
  # PUT /buckle_manu_teches/1.json
  def update
    @buckle_manu_tech = BuckleManuTech.find(params[:id])

    respond_to do |format|
      if @buckle_manu_tech.update_attributes(params[:buckle_manu_tech])
        format.html { redirect_to @buckle_manu_tech, notice: 'Buckle manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_manu_teches/1
  # DELETE /buckle_manu_teches/1.json
  def destroy
    @buckle_manu_tech = BuckleManuTech.find(params[:id])
    @buckle_manu_tech.destroy

    respond_to do |format|
      format.html { redirect_to buckle_manu_teches_url }
      format.json { head :no_content }
    end
  end
end
