class CeramicStyElemMetaDataController < ApplicationController
  before_action :set_ceramic_sty_elem_meta_datum, only: [:show, :edit, :update, :destroy]

  # GET /ceramic_sty_elem_meta_data
  # GET /ceramic_sty_elem_meta_data.json
  def index
    @ceramic_sty_elem_meta_data = CeramicStyElemMetaDatum.all
  end

  # GET /ceramic_sty_elem_meta_data/1
  # GET /ceramic_sty_elem_meta_data/1.json
  def show
  end

  # GET /ceramic_sty_elem_meta_data/new
  def new
    @ceramic_sty_elem_meta_datum = CeramicStyElemMetaDatum.new
  end

  # GET /ceramic_sty_elem_meta_data/1/edit
  def edit
  end

  # POST /ceramic_sty_elem_meta_data
  # POST /ceramic_sty_elem_meta_data.json
  def create
    @ceramic_sty_elem_meta_datum = CeramicStyElemMetaDatum.new(ceramic_sty_elem_meta_datum_params)

    respond_to do |format|
      if @ceramic_sty_elem_meta_datum.save
        format.html { redirect_to @ceramic_sty_elem_meta_datum, notice: 'Ceramic sty elem meta datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ceramic_sty_elem_meta_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @ceramic_sty_elem_meta_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceramic_sty_elem_meta_data/1
  # PATCH/PUT /ceramic_sty_elem_meta_data/1.json
  def update
    respond_to do |format|
      if @ceramic_sty_elem_meta_datum.update(ceramic_sty_elem_meta_datum_params)
        format.html { redirect_to @ceramic_sty_elem_meta_datum, notice: 'Ceramic sty elem meta datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ceramic_sty_elem_meta_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_sty_elem_meta_data/1
  # DELETE /ceramic_sty_elem_meta_data/1.json
  def destroy
    @ceramic_sty_elem_meta_datum.destroy
    respond_to do |format|
      format.html { redirect_to ceramic_sty_elem_meta_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceramic_sty_elem_meta_datum
      @ceramic_sty_elem_meta_datum = CeramicStyElemMetaDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ceramic_sty_elem_meta_datum_params
      params[:ceramic_sty_elem_meta_datum]
    end
end
