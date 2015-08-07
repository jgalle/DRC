class ContextLevelTypesController < ApplicationController
  # GET /context_level_types
  # GET /context_level_types.json
  def index
    @context_level_types = ContextLevelType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_level_types }
    end
  end

  # GET /context_level_types/1
  # GET /context_level_types/1.json
  def show
    @context_level_type = ContextLevelType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_level_type }
    end
  end

  # GET /context_level_types/new
  # GET /context_level_types/new.json
  def new
    @context_level_type = ContextLevelType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_level_type }
    end
  end

  # GET /context_level_types/1/edit
  def edit
    @context_level_type = ContextLevelType.find(params[:id])
  end

  # POST /context_level_types
  # POST /context_level_types.json
  def create
    @context_level_type = ContextLevelType.new(params[:context_level_type])

    respond_to do |format|
      if @context_level_type.save
        format.html { redirect_to @context_level_type, notice: 'Context level type was successfully created.' }
        format.json { render json: @context_level_type, status: :created, location: @context_level_type }
      else
        format.html { render action: "new" }
        format.json { render json: @context_level_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_level_types/1
  # PUT /context_level_types/1.json
  def update
    @context_level_type = ContextLevelType.find(params[:id])

    respond_to do |format|
      if @context_level_type.update_attributes(params[:context_level_type])
        format.html { redirect_to @context_level_type, notice: 'Context level type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_level_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_level_types/1
  # DELETE /context_level_types/1.json
  def destroy
    @context_level_type = ContextLevelType.find(params[:id])
    @context_level_type.destroy

    respond_to do |format|
      format.html { redirect_to context_level_types_url }
      format.json { head :no_content }
    end
  end
end
