class BeadStructuresController < ApplicationController
  # GET /bead_structures
  # GET /bead_structures.json
  def index
    @bead_structures = BeadStructure.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_structures }
    end
  end

  # GET /bead_structures/1
  # GET /bead_structures/1.json
  def show
    @bead_structure = BeadStructure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_structure }
    end
  end

  # GET /bead_structures/new
  # GET /bead_structures/new.json
  def new
    @bead_structure = BeadStructure.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_structure }
    end
  end

  # GET /bead_structures/1/edit
  def edit
    @bead_structure = BeadStructure.find(params[:id])
  end

  # POST /bead_structures
  # POST /bead_structures.json
  def create
    @bead_structure = BeadStructure.new(params[:bead_structure])

    respond_to do |format|
      if @bead_structure.save
        format.html { redirect_to @bead_structure, notice: 'Bead structure was successfully created.' }
        format.json { render json: @bead_structure, status: :created, location: @bead_structure }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_structures/1
  # PUT /bead_structures/1.json
  def update
    @bead_structure = BeadStructure.find(params[:id])

    respond_to do |format|
      if @bead_structure.update_attributes(params[:bead_structure])
        format.html { redirect_to @bead_structure, notice: 'Bead structure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_structures/1
  # DELETE /bead_structures/1.json
  def destroy
    @bead_structure = BeadStructure.find(params[:id])
    @bead_structure.destroy

    respond_to do |format|
      format.html { redirect_to bead_structures_url }
      format.json { head :no_content }
    end
  end
end
