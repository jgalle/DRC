class ContextSampleStatusesController < ApplicationController
  before_action :set_context_sample_status, only: [:show, :edit, :update, :destroy]

  # GET /context_sample_statuses
  # GET /context_sample_statuses.json
  def index
    @context_sample_statuses = ContextSampleStatus.all
  end

  # GET /context_sample_statuses/1
  # GET /context_sample_statuses/1.json
  def show
  end

  # GET /context_sample_statuses/new
  def new
    @context_sample_status = ContextSampleStatus.new
  end

  # GET /context_sample_statuses/1/edit
  def edit
  end

  # POST /context_sample_statuses
  # POST /context_sample_statuses.json
  def create
    @context_sample_status = ContextSampleStatus.new(context_sample_status_params)

    respond_to do |format|
      if @context_sample_status.save
        format.html { redirect_to @context_sample_status, notice: 'Context sample status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @context_sample_status }
      else
        format.html { render action: 'new' }
        format.json { render json: @context_sample_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /context_sample_statuses/1
  # PATCH/PUT /context_sample_statuses/1.json
  def update
    respond_to do |format|
      if @context_sample_status.update(context_sample_status_params)
        format.html { redirect_to @context_sample_status, notice: 'Context sample status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @context_sample_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_sample_statuses/1
  # DELETE /context_sample_statuses/1.json
  def destroy
    @context_sample_status.destroy
    respond_to do |format|
      format.html { redirect_to context_sample_statuses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_context_sample_status
      @context_sample_status = ContextSampleStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def context_sample_status_params
      params[:context_sample_status]
    end
end
