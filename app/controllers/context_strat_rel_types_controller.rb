class ContextStratRelTypesController < ApplicationController
  # GET /context_strat_rel_types
  # GET /context_strat_rel_types.json
  def index
    @context_strat_rel_types = ContextStratRelType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_strat_rel_types }
    end
  end

  # GET /context_strat_rel_types/1
  # GET /context_strat_rel_types/1.json
  def show
    @context_strat_rel_type = ContextStratRelType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_strat_rel_type }
    end
  end

  # GET /context_strat_rel_types/new
  # GET /context_strat_rel_types/new.json
  def new
    @context_strat_rel_type = ContextStratRelType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_strat_rel_type }
    end
  end

  # GET /context_strat_rel_types/1/edit
  def edit
    @context_strat_rel_type = ContextStratRelType.find(params[:id])
  end

  # POST /context_strat_rel_types
  # POST /context_strat_rel_types.json
  def create
    @context_strat_rel_type = ContextStratRelType.new(params[:context_strat_rel_type])

    respond_to do |format|
      if @context_strat_rel_type.save
        format.html { redirect_to @context_strat_rel_type, notice: 'Context strat rel type was successfully created.' }
        format.json { render json: @context_strat_rel_type, status: :created, location: @context_strat_rel_type }
      else
        format.html { render action: "new" }
        format.json { render json: @context_strat_rel_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_strat_rel_types/1
  # PUT /context_strat_rel_types/1.json
  def update
    @context_strat_rel_type = ContextStratRelType.find(params[:id])

    respond_to do |format|
      if @context_strat_rel_type.update_attributes(params[:context_strat_rel_type])
        format.html { redirect_to @context_strat_rel_type, notice: 'Context strat rel type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_strat_rel_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_strat_rel_types/1
  # DELETE /context_strat_rel_types/1.json
  def destroy
    @context_strat_rel_type = ContextStratRelType.find(params[:id])
    @context_strat_rel_type.destroy

    respond_to do |format|
      format.html { redirect_to context_strat_rel_types_url }
      format.json { head :no_content }
    end
  end
end
