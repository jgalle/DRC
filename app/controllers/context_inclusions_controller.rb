class ContextInclusionsController < ApplicationController
  # GET /context_inclusions
  # GET /context_inclusions.json
  def index
    @context_inclusions = ContextInclusion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_inclusions }
    end
  end

  # GET /context_inclusions/1
  # GET /context_inclusions/1.json
  def show
    @context_inclusion = ContextInclusion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_inclusion }
    end
  end

  # GET /context_inclusions/new
  # GET /context_inclusions/new.json
  def new
    @context_inclusion = ContextInclusion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_inclusion }
    end
  end

  # GET /context_inclusions/1/edit
  def edit
    @context_inclusion = ContextInclusion.find(params[:id])
  end

  # POST /context_inclusions
  # POST /context_inclusions.json
  def create
    @context_inclusion = ContextInclusion.new(params[:context_inclusion])

    respond_to do |format|
      if @context_inclusion.save
        format.html { redirect_to @context_inclusion, notice: 'Context inclusion was successfully created.' }
        format.json { render json: @context_inclusion, status: :created, location: @context_inclusion }
      else
        format.html { render action: "new" }
        format.json { render json: @context_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_inclusions/1
  # PUT /context_inclusions/1.json
  def update
    @context_inclusion = ContextInclusion.find(params[:id])

    respond_to do |format|
      if @context_inclusion.update_attributes(params[:context_inclusion])
        format.html { redirect_to @context_inclusion, notice: 'Context inclusion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_inclusions/1
  # DELETE /context_inclusions/1.json
  def destroy
    @context_inclusion = ContextInclusion.find(params[:id])
    @context_inclusion.destroy

    respond_to do |format|
      format.html { redirect_to context_inclusions_url }
      format.json { head :no_content }
    end
  end
end
