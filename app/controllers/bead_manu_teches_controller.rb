class BeadManuTechesController < ApplicationController
  # GET /bead_manu_teches
  # GET /bead_manu_teches.json
  def index
    @bead_manu_teches = BeadManuTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_manu_teches }
    end
  end

  # GET /bead_manu_teches/1
  # GET /bead_manu_teches/1.json
  def show
    @bead_manu_tech = BeadManuTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_manu_tech }
    end
  end

  # GET /bead_manu_teches/new
  # GET /bead_manu_teches/new.json
  def new
    @bead_manu_tech = BeadManuTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_manu_tech }
    end
  end

  # GET /bead_manu_teches/1/edit
  def edit
    @bead_manu_tech = BeadManuTech.find(params[:id])
  end

  # POST /bead_manu_teches
  # POST /bead_manu_teches.json
  def create
    @bead_manu_tech = BeadManuTech.new(params[:bead_manu_tech])

    respond_to do |format|
      if @bead_manu_tech.save
        format.html { redirect_to @bead_manu_tech, notice: 'Bead manu tech was successfully created.' }
        format.json { render json: @bead_manu_tech, status: :created, location: @bead_manu_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_manu_teches/1
  # PUT /bead_manu_teches/1.json
  def update
    @bead_manu_tech = BeadManuTech.find(params[:id])

    respond_to do |format|
      if @bead_manu_tech.update_attributes(params[:bead_manu_tech])
        format.html { redirect_to @bead_manu_tech, notice: 'Bead manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_manu_teches/1
  # DELETE /bead_manu_teches/1.json
  def destroy
    @bead_manu_tech = BeadManuTech.find(params[:id])
    @bead_manu_tech.destroy

    respond_to do |format|
      format.html { redirect_to bead_manu_teches_url }
      format.json { head :no_content }
    end
  end
end
