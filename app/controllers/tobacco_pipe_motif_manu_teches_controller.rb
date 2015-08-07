class TobaccoPipeMotifManuTechesController < ApplicationController
  before_action :set_tobacco_pipe_motif_manu_tech, only: [:show, :edit, :update, :destroy]

  # GET /tobacco_pipe_motif_manu_teches
  # GET /tobacco_pipe_motif_manu_teches.json
  def index
    @tobacco_pipe_motif_manu_teches = TobaccoPipeMotifManuTech.all
  end

  # GET /tobacco_pipe_motif_manu_teches/1
  # GET /tobacco_pipe_motif_manu_teches/1.json
  def show
  end

  # GET /tobacco_pipe_motif_manu_teches/new
  def new
    @tobacco_pipe_motif_manu_tech = TobaccoPipeMotifManuTech.new
  end

  # GET /tobacco_pipe_motif_manu_teches/1/edit
  def edit
  end

  # POST /tobacco_pipe_motif_manu_teches
  # POST /tobacco_pipe_motif_manu_teches.json
  def create
    @tobacco_pipe_motif_manu_tech = TobaccoPipeMotifManuTech.new(tobacco_pipe_motif_manu_tech_params)

    respond_to do |format|
      if @tobacco_pipe_motif_manu_tech.save
        format.html { redirect_to @tobacco_pipe_motif_manu_tech, notice: 'Tobacco pipe motif manu tech was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tobacco_pipe_motif_manu_tech }
      else
        format.html { render action: 'new' }
        format.json { render json: @tobacco_pipe_motif_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tobacco_pipe_motif_manu_teches/1
  # PATCH/PUT /tobacco_pipe_motif_manu_teches/1.json
  def update
    respond_to do |format|
      if @tobacco_pipe_motif_manu_tech.update(tobacco_pipe_motif_manu_tech_params)
        format.html { redirect_to @tobacco_pipe_motif_manu_tech, notice: 'Tobacco pipe motif manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tobacco_pipe_motif_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_motif_manu_teches/1
  # DELETE /tobacco_pipe_motif_manu_teches/1.json
  def destroy
    @tobacco_pipe_motif_manu_tech.destroy
    respond_to do |format|
      format.html { redirect_to tobacco_pipe_motif_manu_teches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tobacco_pipe_motif_manu_tech
      @tobacco_pipe_motif_manu_tech = TobaccoPipeMotifManuTech.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tobacco_pipe_motif_manu_tech_params
      params.require(:tobacco_pipe_motif_manu_tech).permit(:MotifManuTech)
    end
end
