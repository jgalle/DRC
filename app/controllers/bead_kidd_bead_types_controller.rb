class BeadKiddBeadTypesController < ApplicationController
  # GET /bead_kidd_bead_types
  # GET /bead_kidd_bead_types.json
  def index
    @bead_kidd_bead_types = BeadKiddBeadType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_kidd_bead_types }
    end
  end

  # GET /bead_kidd_bead_types/1
  # GET /bead_kidd_bead_types/1.json
  def show
    @bead_kidd_bead_type = BeadKiddBeadType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_kidd_bead_type }
    end
  end

  # GET /bead_kidd_bead_types/new
  # GET /bead_kidd_bead_types/new.json
  def new
    @bead_kidd_bead_type = BeadKiddBeadType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_kidd_bead_type }
    end
  end

  # GET /bead_kidd_bead_types/1/edit
  def edit
    @bead_kidd_bead_type = BeadKiddBeadType.find(params[:id])
  end

  # POST /bead_kidd_bead_types
  # POST /bead_kidd_bead_types.json
  def create
    @bead_kidd_bead_type = BeadKiddBeadType.new(params[:bead_kidd_bead_type])

    respond_to do |format|
      if @bead_kidd_bead_type.save
        format.html { redirect_to @bead_kidd_bead_type, notice: 'Bead kidd bead type was successfully created.' }
        format.json { render json: @bead_kidd_bead_type, status: :created, location: @bead_kidd_bead_type }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_kidd_bead_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_kidd_bead_types/1
  # PUT /bead_kidd_bead_types/1.json
  def update
    @bead_kidd_bead_type = BeadKiddBeadType.find(params[:id])

    respond_to do |format|
      if @bead_kidd_bead_type.update_attributes(params[:bead_kidd_bead_type])
        format.html { redirect_to @bead_kidd_bead_type, notice: 'Bead kidd bead type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_kidd_bead_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_kidd_bead_types/1
  # DELETE /bead_kidd_bead_types/1.json
  def destroy
    @bead_kidd_bead_type = BeadKiddBeadType.find(params[:id])
    @bead_kidd_bead_type.destroy

    respond_to do |format|
      format.html { redirect_to bead_kidd_bead_types_url }
      format.json { head :no_content }
    end
  end
end
