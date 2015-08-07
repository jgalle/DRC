class ContextStpSedimentsController < ApplicationController
  # GET /context_stp_sediments
  # GET /context_stp_sediments.json
  def index
    @context_stp_sediments = ContextStpSediment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_stp_sediments }
    end
  end

  # GET /context_stp_sediments/1
  # GET /context_stp_sediments/1.json
  def show
    @context_stp_sediment = ContextStpSediment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_stp_sediment }
    end
  end

  # GET /context_stp_sediments/new
  # GET /context_stp_sediments/new.json
  def new
    @context_stp_sediment = ContextStpSediment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_stp_sediment }
    end
  end

  # GET /context_stp_sediments/1/edit
  def edit
    @context_stp_sediment = ContextStpSediment.find(params[:id])
  end

  # POST /context_stp_sediments
  # POST /context_stp_sediments.json
  def create
    @context_stp_sediment = ContextStpSediment.new(params[:context_stp_sediment])

    respond_to do |format|
      if @context_stp_sediment.save
        format.html { redirect_to @context_stp_sediment, notice: 'Context stp sediment was successfully created.' }
        format.json { render json: @context_stp_sediment, status: :created, location: @context_stp_sediment }
      else
        format.html { render action: "new" }
        format.json { render json: @context_stp_sediment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_stp_sediments/1
  # PUT /context_stp_sediments/1.json
  def update
    @context_stp_sediment = ContextStpSediment.find(params[:id])

    respond_to do |format|
      if @context_stp_sediment.update_attributes(params[:context_stp_sediment])
        format.html { redirect_to @context_stp_sediment, notice: 'Context stp sediment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_stp_sediment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_stp_sediments/1
  # DELETE /context_stp_sediments/1.json
  def destroy
    @context_stp_sediment = ContextStpSediment.find(params[:id])
    @context_stp_sediment.destroy

    respond_to do |format|
      format.html { redirect_to context_stp_sediments_url }
      format.json { head :no_content }
    end
  end
end
