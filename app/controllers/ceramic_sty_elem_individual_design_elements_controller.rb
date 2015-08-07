class CeramicStyElemIndividualDesignElementsController < ApplicationController
  before_action :set_ceramic_sty_elem_individual_design_element, only: [:show, :edit, :update, :destroy]

  # GET /ceramic_sty_elem_individual_design_elements
  # GET /ceramic_sty_elem_individual_design_elements.json
  def index
    @ceramic_sty_elem_individual_design_elements = CeramicStyElemIndividualDesignElement.all
  end

  # GET /ceramic_sty_elem_individual_design_elements/1
  # GET /ceramic_sty_elem_individual_design_elements/1.json
  def show
  end

  # GET /ceramic_sty_elem_individual_design_elements/new
  def new
    @ceramic_sty_elem_individual_design_element = CeramicStyElemIndividualDesignElement.new
  end

  # GET /ceramic_sty_elem_individual_design_elements/1/edit
  def edit
  end

  # POST /ceramic_sty_elem_individual_design_elements
  # POST /ceramic_sty_elem_individual_design_elements.json
  def create
    @ceramic_sty_elem_individual_design_element = CeramicStyElemIndividualDesignElement.new(ceramic_sty_elem_individual_design_element_params)

    respond_to do |format|
      if @ceramic_sty_elem_individual_design_element.save
        format.html { redirect_to @ceramic_sty_elem_individual_design_element, notice: 'Ceramic sty elem individual design element was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ceramic_sty_elem_individual_design_element }
      else
        format.html { render action: 'new' }
        format.json { render json: @ceramic_sty_elem_individual_design_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceramic_sty_elem_individual_design_elements/1
  # PATCH/PUT /ceramic_sty_elem_individual_design_elements/1.json
  def update
    respond_to do |format|
      if @ceramic_sty_elem_individual_design_element.update(ceramic_sty_elem_individual_design_element_params)
        format.html { redirect_to @ceramic_sty_elem_individual_design_element, notice: 'Ceramic sty elem individual design element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ceramic_sty_elem_individual_design_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_sty_elem_individual_design_elements/1
  # DELETE /ceramic_sty_elem_individual_design_elements/1.json
  def destroy
    @ceramic_sty_elem_individual_design_element.destroy
    respond_to do |format|
      format.html { redirect_to ceramic_sty_elem_individual_design_elements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceramic_sty_elem_individual_design_element
      @ceramic_sty_elem_individual_design_element = CeramicStyElemIndividualDesignElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ceramic_sty_elem_individual_design_element_params
      params[:ceramic_sty_elem_individual_design_element]
    end
end
