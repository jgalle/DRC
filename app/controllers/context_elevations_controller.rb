class ContextElevationsController < ApplicationController
  # GET /context_elevations
  # GET /context_elevations.json
  def index
    @context_elevations = ContextElevation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_elevations }
    end
  end

  # GET /context_elevations/1
  # GET /context_elevations/1.json
  def show
    @context_elevation = ContextElevation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_elevation }
    end
  end

  # GET /context_elevations/new
  # GET /context_elevations/new.json
  def new
    @context_elevation = ContextElevation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_elevation }
    end
  end

  # GET /context_elevations/1/edit
  def edit
    @context_elevation = ContextElevation.find(params[:id])
  end

  # POST /context_elevations
  # POST /context_elevations.json
  def create
    @context_elevation = ContextElevation.new(params[:context_elevation])

    respond_to do |format|
      if @context_elevation.save
        format.html { redirect_to @context_elevation, notice: 'Context elevation was successfully created.' }
        format.json { render json: @context_elevation, status: :created, location: @context_elevation }
      else
        format.html { render action: "new" }
        format.json { render json: @context_elevation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_elevations/1
  # PUT /context_elevations/1.json
  def update
    @context_elevation = ContextElevation.find(params[:id])

    respond_to do |format|
      if @context_elevation.update_attributes(params[:context_elevation])
        format.html { redirect_to @context_elevation, notice: 'Context elevation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_elevation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_elevations/1
  # DELETE /context_elevations/1.json
  def destroy
    @context_elevation = ContextElevation.find(params[:id])
    @context_elevation.destroy

    respond_to do |format|
      format.html { redirect_to context_elevations_url }
      format.json { head :no_content }
    end
  end
end
