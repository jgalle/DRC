class CeramicStyElemWaresController < ApplicationController
  before_action :set_ceramic_sty_elem_ware, only: [:show, :edit, :update, :destroy]

  # GET /ceramic_sty_elem_wares
  # GET /ceramic_sty_elem_wares.json
  def index
    @ceramic_sty_elem_wares = CeramicStyElemWare.all
  end

  # GET /ceramic_sty_elem_wares/1
  # GET /ceramic_sty_elem_wares/1.json
  def show
  end

  # GET /ceramic_sty_elem_wares/new
  def new
    @ceramic_sty_elem_ware = CeramicStyElemWare.new
  end

  # GET /ceramic_sty_elem_wares/1/edit
  def edit
  end

  # POST /ceramic_sty_elem_wares
  # POST /ceramic_sty_elem_wares.json
  def create
    @ceramic_sty_elem_ware = CeramicStyElemWare.new(ceramic_sty_elem_ware_params)

    respond_to do |format|
      if @ceramic_sty_elem_ware.save
        format.html { redirect_to @ceramic_sty_elem_ware, notice: 'Ceramic sty elem ware was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ceramic_sty_elem_ware }
      else
        format.html { render action: 'new' }
        format.json { render json: @ceramic_sty_elem_ware.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceramic_sty_elem_wares/1
  # PATCH/PUT /ceramic_sty_elem_wares/1.json
  def update
    respond_to do |format|
      if @ceramic_sty_elem_ware.update(ceramic_sty_elem_ware_params)
        format.html { redirect_to @ceramic_sty_elem_ware, notice: 'Ceramic sty elem ware was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ceramic_sty_elem_ware.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_sty_elem_wares/1
  # DELETE /ceramic_sty_elem_wares/1.json
  def destroy
    @ceramic_sty_elem_ware.destroy
    respond_to do |format|
      format.html { redirect_to ceramic_sty_elem_wares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceramic_sty_elem_ware
      @ceramic_sty_elem_ware = CeramicStyElemWare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ceramic_sty_elem_ware_params
      params[:ceramic_sty_elem_ware]
    end
end
