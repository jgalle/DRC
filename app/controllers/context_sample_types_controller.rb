class ContextSampleTypesController < ApplicationController
  # GET /context_sample_types
  # GET /context_sample_types.json
  def index
    @context_sample_types = ContextSampleType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_sample_types }
    end
  end

  # GET /context_sample_types/1
  # GET /context_sample_types/1.json
  def show
    @context_sample_type = ContextSampleType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_sample_type }
    end
  end

  # GET /context_sample_types/new
  # GET /context_sample_types/new.json
  def new
    @context_sample_type = ContextSampleType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_sample_type }
    end
  end

  # GET /context_sample_types/1/edit
  def edit
    @context_sample_type = ContextSampleType.find(params[:id])
  end

  # POST /context_sample_types
  # POST /context_sample_types.json
  def create
    @context_sample_type = ContextSampleType.new(params[:context_sample_type])

    respond_to do |format|
      if @context_sample_type.save
        format.html { redirect_to @context_sample_type, notice: 'Context sample type was successfully created.' }
        format.json { render json: @context_sample_type, status: :created, location: @context_sample_type }
      else
        format.html { render action: "new" }
        format.json { render json: @context_sample_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_sample_types/1
  # PUT /context_sample_types/1.json
  def update
    @context_sample_type = ContextSampleType.find(params[:id])

    respond_to do |format|
      if @context_sample_type.update_attributes(params[:context_sample_type])
        format.html { redirect_to @context_sample_type, notice: 'Context sample type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_sample_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_sample_types/1
  # DELETE /context_sample_types/1.json
  def destroy
    @context_sample_type = ContextSampleType.find(params[:id])
    @context_sample_type.destroy

    respond_to do |format|
      format.html { redirect_to context_sample_types_url }
      format.json { head :no_content }
    end
  end
end
