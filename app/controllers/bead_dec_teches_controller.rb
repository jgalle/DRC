class BeadDecTechesController < ApplicationController
  # GET /bead_dec_teches
  # GET /bead_dec_teches.json
  def index
    @bead_dec_teches = BeadDecTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_dec_teches }
    end
  end

  # GET /bead_dec_teches/1
  # GET /bead_dec_teches/1.json
  def show
    @bead_dec_tech = BeadDecTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_dec_tech }
    end
  end

  # GET /bead_dec_teches/new
  # GET /bead_dec_teches/new.json
  def new
    @bead_dec_tech = BeadDecTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_dec_tech }
    end
  end

  # GET /bead_dec_teches/1/edit
  def edit
    @bead_dec_tech = BeadDecTech.find(params[:id])
  end

  # POST /bead_dec_teches
  # POST /bead_dec_teches.json
  def create
    @bead_dec_tech = BeadDecTech.new(params[:bead_dec_tech])

    respond_to do |format|
      if @bead_dec_tech.save
        format.html { redirect_to @bead_dec_tech, notice: 'Bead dec tech was successfully created.' }
        format.json { render json: @bead_dec_tech, status: :created, location: @bead_dec_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_dec_teches/1
  # PUT /bead_dec_teches/1.json
  def update
    @bead_dec_tech = BeadDecTech.find(params[:id])

    respond_to do |format|
      if @bead_dec_tech.update_attributes(params[:bead_dec_tech])
        format.html { redirect_to @bead_dec_tech, notice: 'Bead dec tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_dec_teches/1
  # DELETE /bead_dec_teches/1.json
  def destroy
    @bead_dec_tech = BeadDecTech.find(params[:id])
    @bead_dec_tech.destroy

    respond_to do |format|
      format.html { redirect_to bead_dec_teches_url }
      format.json { head :no_content }
    end
  end
end
