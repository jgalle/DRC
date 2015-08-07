class ContextSampleInstitutionsController < ApplicationController
  before_action :set_context_sample_institution, only: [:show, :edit, :update, :destroy]

  # GET /context_sample_institutions
  # GET /context_sample_institutions.json
  def index
    @context_sample_institutions = ContextSampleInstitution.all
  end

  # GET /context_sample_institutions/1
  # GET /context_sample_institutions/1.json
  def show
  end

  # GET /context_sample_institutions/new
  def new
    @context_sample_institution = ContextSampleInstitution.new
  end

  # GET /context_sample_institutions/1/edit
  def edit
  end

  # POST /context_sample_institutions
  # POST /context_sample_institutions.json
  def create
    @context_sample_institution = ContextSampleInstitution.new(context_sample_institution_params)

    respond_to do |format|
      if @context_sample_institution.save
        format.html { redirect_to @context_sample_institution, notice: 'Context sample institution was successfully created.' }
        format.json { render action: 'show', status: :created, location: @context_sample_institution }
      else
        format.html { render action: 'new' }
        format.json { render json: @context_sample_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /context_sample_institutions/1
  # PATCH/PUT /context_sample_institutions/1.json
  def update
    respond_to do |format|
      if @context_sample_institution.update(context_sample_institution_params)
        format.html { redirect_to @context_sample_institution, notice: 'Context sample institution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @context_sample_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_sample_institutions/1
  # DELETE /context_sample_institutions/1.json
  def destroy
    @context_sample_institution.destroy
    respond_to do |format|
      format.html { redirect_to context_sample_institutions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_context_sample_institution
      @context_sample_institution = ContextSampleInstitution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def context_sample_institution_params
      params[:context_sample_institution]
    end
end
