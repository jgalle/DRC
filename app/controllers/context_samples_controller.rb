class ContextSamplesController < ApplicationController
  # GET /context_samples
  # GET /context_samples.json
  def index
    @context_samples = ContextSample.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_samples }
    end
  end

  # GET /context_samples/1
  # GET /context_samples/1.json
  def show
    @context_sample = ContextSample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_sample }
    end
  end

  # GET /context_samples/new
  # GET /context_samples/new.json
  def new
    @context_sample = ContextSample.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_sample }
    end
  end

  # GET /context_samples/1/edit
  def edit
    @context_sample = ContextSample.find(params[:id])
  end

  # POST /context_samples
  # POST /context_samples.json
  def create
    @context_sample = ContextSample.new(params[:context_sample])

    respond_to do |format|
      if @context_sample.save
        format.html { redirect_to @context_sample, notice: 'Context sample was successfully created.' }
        format.json { render json: @context_sample, status: :created, location: @context_sample }
      else
        format.html { render action: "new" }
        format.json { render json: @context_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_samples/1
  # PUT /context_samples/1.json
  def update
    @context_sample = ContextSample.find(params[:id])

    respond_to do |format|
      if @context_sample.update_attributes(params[:context_sample])
        format.html { redirect_to @context_sample, notice: 'Context sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_samples/1
  # DELETE /context_samples/1.json
  def destroy
    @context_sample = ContextSample.find(params[:id])
    @context_sample.destroy

    respond_to do |format|
      format.html { redirect_to context_samples_url }
      format.json { head :no_content }
    end
  end
end
