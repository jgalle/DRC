class BeadDiaphaneitiesController < ApplicationController
  # GET /bead_diaphaneities
  # GET /bead_diaphaneities.json
  def index
    @bead_diaphaneities = BeadDiaphaneity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_diaphaneities }
    end
  end

  # GET /bead_diaphaneities/1
  # GET /bead_diaphaneities/1.json
  def show
    @bead_diaphaneity = BeadDiaphaneity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_diaphaneity }
    end
  end

  # GET /bead_diaphaneities/new
  # GET /bead_diaphaneities/new.json
  def new
    @bead_diaphaneity = BeadDiaphaneity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_diaphaneity }
    end
  end

  # GET /bead_diaphaneities/1/edit
  def edit
    @bead_diaphaneity = BeadDiaphaneity.find(params[:id])
  end

  # POST /bead_diaphaneities
  # POST /bead_diaphaneities.json
  def create
    @bead_diaphaneity = BeadDiaphaneity.new(params[:bead_diaphaneity])

    respond_to do |format|
      if @bead_diaphaneity.save
        format.html { redirect_to @bead_diaphaneity, notice: 'Bead diaphaneity was successfully created.' }
        format.json { render json: @bead_diaphaneity, status: :created, location: @bead_diaphaneity }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_diaphaneity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_diaphaneities/1
  # PUT /bead_diaphaneities/1.json
  def update
    @bead_diaphaneity = BeadDiaphaneity.find(params[:id])

    respond_to do |format|
      if @bead_diaphaneity.update_attributes(params[:bead_diaphaneity])
        format.html { redirect_to @bead_diaphaneity, notice: 'Bead diaphaneity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_diaphaneity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_diaphaneities/1
  # DELETE /bead_diaphaneities/1.json
  def destroy
    @bead_diaphaneity = BeadDiaphaneity.find(params[:id])
    @bead_diaphaneity.destroy

    respond_to do |format|
      format.html { redirect_to bead_diaphaneities_url }
      format.json { head :no_content }
    end
  end
end
