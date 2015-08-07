class ContextStratRelsController < ApplicationController
  # GET /context_strat_rels
  # GET /context_strat_rels.json
  def index
    @context_strat_rels = ContextStratRel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_strat_rels }
    end
  end

  # GET /context_strat_rels/1
  # GET /context_strat_rels/1.json
  def show
    @context_strat_rel = ContextStratRel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_strat_rel }
    end
  end

  # GET /context_strat_rels/new
  # GET /context_strat_rels/new.json
  def new
    @context_strat_rel = ContextStratRel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_strat_rel }
    end
  end

  # GET /context_strat_rels/1/edit
  def edit
    @context_strat_rel = ContextStratRel.find(params[:id])
  end

  # POST /context_strat_rels
  # POST /context_strat_rels.json
  def create
    @context_strat_rel = ContextStratRel.new(params[:context_strat_rel])

    respond_to do |format|
      if @context_strat_rel.save
        format.html { redirect_to @context_strat_rel, notice: 'Context strat rel was successfully created.' }
        format.json { render json: @context_strat_rel, status: :created, location: @context_strat_rel }
      else
        format.html { render action: "new" }
        format.json { render json: @context_strat_rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_strat_rels/1
  # PUT /context_strat_rels/1.json
  def update
    @context_strat_rel = ContextStratRel.find(params[:id])

    respond_to do |format|
      if @context_strat_rel.update_attributes(params[:context_strat_rel])
        format.html { redirect_to @context_strat_rel, notice: 'Context strat rel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_strat_rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_strat_rels/1
  # DELETE /context_strat_rels/1.json
  def destroy
    @context_strat_rel = ContextStratRel.find(params[:id])
    @context_strat_rel.destroy

    respond_to do |format|
      format.html { redirect_to context_strat_rels_url }
      format.json { head :no_content }
    end
  end
end
