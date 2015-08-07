class BuckleDecTechesController < ApplicationController
  # GET /buckle_dec_teches
  # GET /buckle_dec_teches.json
  def index
    @buckle_dec_teches = BuckleDecTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_dec_teches }
    end
  end

  # GET /buckle_dec_teches/1
  # GET /buckle_dec_teches/1.json
  def show
    @buckle_dec_tech = BuckleDecTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_dec_tech }
    end
  end

  # GET /buckle_dec_teches/new
  # GET /buckle_dec_teches/new.json
  def new
    @buckle_dec_tech = BuckleDecTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_dec_tech }
    end
  end

  # GET /buckle_dec_teches/1/edit
  def edit
    @buckle_dec_tech = BuckleDecTech.find(params[:id])
  end

  # POST /buckle_dec_teches
  # POST /buckle_dec_teches.json
  def create
    @buckle_dec_tech = BuckleDecTech.new(params[:buckle_dec_tech])

    respond_to do |format|
      if @buckle_dec_tech.save
        format.html { redirect_to @buckle_dec_tech, notice: 'Buckle dec tech was successfully created.' }
        format.json { render json: @buckle_dec_tech, status: :created, location: @buckle_dec_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_dec_teches/1
  # PUT /buckle_dec_teches/1.json
  def update
    @buckle_dec_tech = BuckleDecTech.find(params[:id])

    respond_to do |format|
      if @buckle_dec_tech.update_attributes(params[:buckle_dec_tech])
        format.html { redirect_to @buckle_dec_tech, notice: 'Buckle dec tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_dec_teches/1
  # DELETE /buckle_dec_teches/1.json
  def destroy
    @buckle_dec_tech = BuckleDecTech.find(params[:id])
    @buckle_dec_tech.destroy

    respond_to do |format|
      format.html { redirect_to buckle_dec_teches_url }
      format.json { head :no_content }
    end
  end
end
