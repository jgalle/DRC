class ContextStpInclusionsController < ApplicationController
  # GET /context_stp_inclusions
  # GET /context_stp_inclusions.json
  def index
    @context_stp_inclusions = ContextStpInclusion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_stp_inclusions }
    end
  end

  # GET /context_stp_inclusions/1
  # GET /context_stp_inclusions/1.json
  def show
    @context_stp_inclusion = ContextStpInclusion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_stp_inclusion }
    end
  end

  # GET /context_stp_inclusions/new
  # GET /context_stp_inclusions/new.json
  def new
    @context_stp_inclusion = ContextStpInclusion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_stp_inclusion }
    end
  end

  # GET /context_stp_inclusions/1/edit
  def edit
    @context_stp_inclusion = ContextStpInclusion.find(params[:id])
  end

  # POST /context_stp_inclusions
  # POST /context_stp_inclusions.json
  def create
    @context_stp_inclusion = ContextStpInclusion.new(params[:context_stp_inclusion])

    respond_to do |format|
      if @context_stp_inclusion.save
        format.html { redirect_to @context_stp_inclusion, notice: 'Context stp inclusion was successfully created.' }
        format.json { render json: @context_stp_inclusion, status: :created, location: @context_stp_inclusion }
      else
        format.html { render action: "new" }
        format.json { render json: @context_stp_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_stp_inclusions/1
  # PUT /context_stp_inclusions/1.json
  def update
    @context_stp_inclusion = ContextStpInclusion.find(params[:id])

    respond_to do |format|
      if @context_stp_inclusion.update_attributes(params[:context_stp_inclusion])
        format.html { redirect_to @context_stp_inclusion, notice: 'Context stp inclusion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_stp_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_stp_inclusions/1
  # DELETE /context_stp_inclusions/1.json
  def destroy
    @context_stp_inclusion = ContextStpInclusion.find(params[:id])
    @context_stp_inclusion.destroy

    respond_to do |format|
      format.html { redirect_to context_stp_inclusions_url }
      format.json { head :no_content }
    end
  end
end
