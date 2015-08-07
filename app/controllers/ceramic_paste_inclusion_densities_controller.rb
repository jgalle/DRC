class CeramicPasteInclusionDensitiesController < ApplicationController
  # GET /ceramic_paste_inclusion_densities
  # GET /ceramic_paste_inclusion_densities.json
  def index
    @ceramic_paste_inclusion_densities = CeramicPasteInclusionDensity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_paste_inclusion_densities }
    end
  end

  # GET /ceramic_paste_inclusion_densities/1
  # GET /ceramic_paste_inclusion_densities/1.json
  def show
    @ceramic_paste_inclusion_density = CeramicPasteInclusionDensity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_paste_inclusion_density }
    end
  end

  # GET /ceramic_paste_inclusion_densities/new
  # GET /ceramic_paste_inclusion_densities/new.json
  def new
    @ceramic_paste_inclusion_density = CeramicPasteInclusionDensity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_paste_inclusion_density }
    end
  end

  # GET /ceramic_paste_inclusion_densities/1/edit
  def edit
    @ceramic_paste_inclusion_density = CeramicPasteInclusionDensity.find(params[:id])
  end

  # POST /ceramic_paste_inclusion_densities
  # POST /ceramic_paste_inclusion_densities.json
  def create
    @ceramic_paste_inclusion_density = CeramicPasteInclusionDensity.new(params[:ceramic_paste_inclusion_density])

    respond_to do |format|
      if @ceramic_paste_inclusion_density.save
        format.html { redirect_to @ceramic_paste_inclusion_density, notice: 'Ceramic paste inclusion density was successfully created.' }
        format.json { render json: @ceramic_paste_inclusion_density, status: :created, location: @ceramic_paste_inclusion_density }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_paste_inclusion_density.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_paste_inclusion_densities/1
  # PUT /ceramic_paste_inclusion_densities/1.json
  def update
    @ceramic_paste_inclusion_density = CeramicPasteInclusionDensity.find(params[:id])

    respond_to do |format|
      if @ceramic_paste_inclusion_density.update_attributes(params[:ceramic_paste_inclusion_density])
        format.html { redirect_to @ceramic_paste_inclusion_density, notice: 'Ceramic paste inclusion density was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_paste_inclusion_density.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_paste_inclusion_densities/1
  # DELETE /ceramic_paste_inclusion_densities/1.json
  def destroy
    @ceramic_paste_inclusion_density = CeramicPasteInclusionDensity.find(params[:id])
    @ceramic_paste_inclusion_density.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_paste_inclusion_densities_url }
      format.json { head :no_content }
    end
  end
end
