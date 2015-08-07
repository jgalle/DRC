class BeadCasingsController < ApplicationController
  # GET /bead_casings
  # GET /bead_casings.json
  def index
    @bead_casings = BeadCasing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_casings }
    end
  end

  # GET /bead_casings/1
  # GET /bead_casings/1.json
  def show
    @bead_casing = BeadCasing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_casing }
    end
  end

  # GET /bead_casings/new
  # GET /bead_casings/new.json
  def new
    @bead_casing = BeadCasing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_casing }
    end
  end

  # GET /bead_casings/1/edit
  def edit
    @bead_casing = BeadCasing.find(params[:id])
  end

  # POST /bead_casings
  # POST /bead_casings.json
  def create
    @bead_casing = BeadCasing.new(params[:bead_casing])

    respond_to do |format|
      if @bead_casing.save
        format.html { redirect_to @bead_casing, notice: 'Bead casing was successfully created.' }
        format.json { render json: @bead_casing, status: :created, location: @bead_casing }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_casing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_casings/1
  # PUT /bead_casings/1.json
  def update
    @bead_casing = BeadCasing.find(params[:id])

    respond_to do |format|
      if @bead_casing.update_attributes(params[:bead_casing])
        format.html { redirect_to @bead_casing, notice: 'Bead casing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_casing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_casings/1
  # DELETE /bead_casings/1.json
  def destroy
    @bead_casing = BeadCasing.find(params[:id])
    @bead_casing.destroy

    respond_to do |format|
      format.html { redirect_to bead_casings_url }
      format.json { head :no_content }
    end
  end
end
