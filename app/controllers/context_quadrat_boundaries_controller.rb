class ContextQuadratBoundariesController < ApplicationController
  # GET /context_quadrat_boundaries
  # GET /context_quadrat_boundaries.json
  def index
    @context_quadrat_boundaries = ContextQuadratBoundary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_quadrat_boundaries }
    end
  end

  # GET /context_quadrat_boundaries/1
  # GET /context_quadrat_boundaries/1.json
  def show
    @context_quadrat_boundary = ContextQuadratBoundary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_quadrat_boundary }
    end
  end

  # GET /context_quadrat_boundaries/new
  # GET /context_quadrat_boundaries/new.json
  def new
    @context_quadrat_boundary = ContextQuadratBoundary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_quadrat_boundary }
    end
  end

  # GET /context_quadrat_boundaries/1/edit
  def edit
    @context_quadrat_boundary = ContextQuadratBoundary.find(params[:id])
  end

  # POST /context_quadrat_boundaries
  # POST /context_quadrat_boundaries.json
  def create
    @context_quadrat_boundary = ContextQuadratBoundary.new(params[:context_quadrat_boundary])

    respond_to do |format|
      if @context_quadrat_boundary.save
        format.html { redirect_to @context_quadrat_boundary, notice: 'Context quadrat boundary was successfully created.' }
        format.json { render json: @context_quadrat_boundary, status: :created, location: @context_quadrat_boundary }
      else
        format.html { render action: "new" }
        format.json { render json: @context_quadrat_boundary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_quadrat_boundaries/1
  # PUT /context_quadrat_boundaries/1.json
  def update
    @context_quadrat_boundary = ContextQuadratBoundary.find(params[:id])

    respond_to do |format|
      if @context_quadrat_boundary.update_attributes(params[:context_quadrat_boundary])
        format.html { redirect_to @context_quadrat_boundary, notice: 'Context quadrat boundary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_quadrat_boundary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_quadrat_boundaries/1
  # DELETE /context_quadrat_boundaries/1.json
  def destroy
    @context_quadrat_boundary = ContextQuadratBoundary.find(params[:id])
    @context_quadrat_boundary.destroy

    respond_to do |format|
      format.html { redirect_to context_quadrat_boundaries_url }
      format.json { head :no_content }
    end
  end
end
