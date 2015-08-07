class CeramicStyElemIndividualDesignsController < ApplicationController
  before_action :set_ceramic_sty_elem_individual_design, only: [:show, :edit, :update, :destroy]

  # GET /ceramic_sty_elem_individual_designs
  # GET /ceramic_sty_elem_individual_designs.json
  def index
    @ceramic_sty_elem_individual_designs = CeramicStyElemIndividualDesign.all
  end

  # GET /ceramic_sty_elem_individual_designs/1
  # GET /ceramic_sty_elem_individual_designs/1.json
  def show
  end

  # GET /ceramic_sty_elem_individual_designs/new
  def new
    @ceramic_sty_elem_individual_design = CeramicStyElemIndividualDesign.new
  end

  # GET /ceramic_sty_elem_individual_designs/1/edit
  def edit
  end

  # POST /ceramic_sty_elem_individual_designs
  # POST /ceramic_sty_elem_individual_designs.json
  def create
    @ceramic_sty_elem_individual_design = CeramicStyElemIndividualDesign.new(ceramic_sty_elem_individual_design_params)

    respond_to do |format|
      if @ceramic_sty_elem_individual_design.save
        format.html { redirect_to @ceramic_sty_elem_individual_design, notice: 'Ceramic sty elem individual design was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ceramic_sty_elem_individual_design }
      else
        format.html { render action: 'new' }
        format.json { render json: @ceramic_sty_elem_individual_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceramic_sty_elem_individual_designs/1
  # PATCH/PUT /ceramic_sty_elem_individual_designs/1.json
  def update
    respond_to do |format|
      if @ceramic_sty_elem_individual_design.update(ceramic_sty_elem_individual_design_params)
        format.html { redirect_to @ceramic_sty_elem_individual_design, notice: 'Ceramic sty elem individual design was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ceramic_sty_elem_individual_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_sty_elem_individual_designs/1
  # DELETE /ceramic_sty_elem_individual_designs/1.json
  def destroy
    @ceramic_sty_elem_individual_design.destroy
    respond_to do |format|
      format.html { redirect_to ceramic_sty_elem_individual_designs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceramic_sty_elem_individual_design
      @ceramic_sty_elem_individual_design = CeramicStyElemIndividualDesign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ceramic_sty_elem_individual_design_params
      params[:ceramic_sty_elem_individual_design]
    end
end
