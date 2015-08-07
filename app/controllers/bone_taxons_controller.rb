class BoneTaxonsController < ApplicationController
  # GET /bone_taxons
  # GET /bone_taxons.json
  def index
    @bone_taxons = BoneTaxon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_taxons }
    end
  end

  # GET /bone_taxons/1
  # GET /bone_taxons/1.json
  def show
    @bone_taxon = BoneTaxon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_taxon }
    end
  end

  # GET /bone_taxons/new
  # GET /bone_taxons/new.json
  def new
    @bone_taxon = BoneTaxon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_taxon }
    end
  end

  # GET /bone_taxons/1/edit
  def edit
    @bone_taxon = BoneTaxon.find(params[:id])
  end

  # POST /bone_taxons
  # POST /bone_taxons.json
  def create
    @bone_taxon = BoneTaxon.new(params[:bone_taxon])

    respond_to do |format|
      if @bone_taxon.save
        format.html { redirect_to @bone_taxon, notice: 'Bone taxon was successfully created.' }
        format.json { render json: @bone_taxon, status: :created, location: @bone_taxon }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_taxons/1
  # PUT /bone_taxons/1.json
  def update
    @bone_taxon = BoneTaxon.find(params[:id])

    respond_to do |format|
      if @bone_taxon.update_attributes(params[:bone_taxon])
        format.html { redirect_to @bone_taxon, notice: 'Bone taxon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_taxons/1
  # DELETE /bone_taxons/1.json
  def destroy
    @bone_taxon = BoneTaxon.find(params[:id])
    @bone_taxon.destroy

    respond_to do |format|
      format.html { redirect_to bone_taxons_url }
      format.json { head :no_content }
    end
  end
end
