class CeramicStyElemManuTechesController < ApplicationController
  before_action :set_ceramic_sty_elem_manu_tech, only: [:show, :edit, :update, :destroy]

  # GET /ceramic_sty_elem_manu_teches
  # GET /ceramic_sty_elem_manu_teches.json
  def index
    @ceramic_sty_elem_manu_teches = CeramicStyElemManuTech.all
  end

  # GET /ceramic_sty_elem_manu_teches/1
  # GET /ceramic_sty_elem_manu_teches/1.json
  def show
  end

  # GET /ceramic_sty_elem_manu_teches/new
  def new
    @ceramic_sty_elem_manu_tech = CeramicStyElemManuTech.new
  end

  # GET /ceramic_sty_elem_manu_teches/1/edit
  def edit
  end

  # POST /ceramic_sty_elem_manu_teches
  # POST /ceramic_sty_elem_manu_teches.json
  def create
    @ceramic_sty_elem_manu_tech = CeramicStyElemManuTech.new(ceramic_sty_elem_manu_tech_params)

    respond_to do |format|
      if @ceramic_sty_elem_manu_tech.save
        format.html { redirect_to @ceramic_sty_elem_manu_tech, notice: 'Ceramic sty elem manu tech was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ceramic_sty_elem_manu_tech }
      else
        format.html { render action: 'new' }
        format.json { render json: @ceramic_sty_elem_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceramic_sty_elem_manu_teches/1
  # PATCH/PUT /ceramic_sty_elem_manu_teches/1.json
  def update
    respond_to do |format|
      if @ceramic_sty_elem_manu_tech.update(ceramic_sty_elem_manu_tech_params)
        format.html { redirect_to @ceramic_sty_elem_manu_tech, notice: 'Ceramic sty elem manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ceramic_sty_elem_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_sty_elem_manu_teches/1
  # DELETE /ceramic_sty_elem_manu_teches/1.json
  def destroy
    @ceramic_sty_elem_manu_tech.destroy
    respond_to do |format|
      format.html { redirect_to ceramic_sty_elem_manu_teches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceramic_sty_elem_manu_tech
      @ceramic_sty_elem_manu_tech = CeramicStyElemManuTech.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ceramic_sty_elem_manu_tech_params
      params[:ceramic_sty_elem_manu_tech]
    end
end
