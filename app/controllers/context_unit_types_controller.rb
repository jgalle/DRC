class ContextUnitTypesController < ApplicationController
  # GET /context_unit_types
  # GET /context_unit_types.json
  def index
    @context_unit_types = ContextUnitType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_unit_types }
    end
  end

  # GET /context_unit_types/1
  # GET /context_unit_types/1.json
  def show
    @context_unit_type = ContextUnitType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_unit_type }
    end
  end

  # GET /context_unit_types/new
  # GET /context_unit_types/new.json
  def new
    @context_unit_type = ContextUnitType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_unit_type }
    end
  end

  # GET /context_unit_types/1/edit
  def edit
    @context_unit_type = ContextUnitType.find(params[:id])
  end

  # POST /context_unit_types
  # POST /context_unit_types.json
  def create
    @context_unit_type = ContextUnitType.new(params[:context_unit_type])

    respond_to do |format|
      if @context_unit_type.save
        format.html { redirect_to @context_unit_type, notice: 'Context unit type was successfully created.' }
        format.json { render json: @context_unit_type, status: :created, location: @context_unit_type }
      else
        format.html { render action: "new" }
        format.json { render json: @context_unit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_unit_types/1
  # PUT /context_unit_types/1.json
  def update
    @context_unit_type = ContextUnitType.find(params[:id])

    respond_to do |format|
      if @context_unit_type.update_attributes(params[:context_unit_type])
        format.html { redirect_to @context_unit_type, notice: 'Context unit type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_unit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_unit_types/1
  # DELETE /context_unit_types/1.json
  def destroy
    @context_unit_type = ContextUnitType.find(params[:id])
    @context_unit_type.destroy

    respond_to do |format|
      format.html { redirect_to context_unit_types_url }
      format.json { head :no_content }
    end
  end
end
