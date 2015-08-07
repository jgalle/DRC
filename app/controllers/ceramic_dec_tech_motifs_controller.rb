class CeramicDecTechMotifsController < ApplicationController
  # GET /ceramic_dec_tech_motifs
  # GET /ceramic_dec_tech_motifs.json
  def index
    @ceramic_dec_tech_motifs = CeramicDecTechMotif.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_dec_tech_motifs }
    end
  end

  # GET /ceramic_dec_tech_motifs/1
  # GET /ceramic_dec_tech_motifs/1.json
  def show
    @ceramic_dec_tech_motif = CeramicDecTechMotif.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_dec_tech_motif }
    end
  end

  # GET /ceramic_dec_tech_motifs/new
  # GET /ceramic_dec_tech_motifs/new.json
  def new
    @ceramic_dec_tech_motif = CeramicDecTechMotif.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_dec_tech_motif }
    end
  end

  # GET /ceramic_dec_tech_motifs/1/edit
  def edit
    @ceramic_dec_tech_motif = CeramicDecTechMotif.find(params[:id])
  end

  # POST /ceramic_dec_tech_motifs
  # POST /ceramic_dec_tech_motifs.json
  def create
    @ceramic_dec_tech_motif = CeramicDecTechMotif.new(params[:ceramic_dec_tech_motif])

    respond_to do |format|
      if @ceramic_dec_tech_motif.save
        format.html { redirect_to @ceramic_dec_tech_motif, notice: 'Ceramic dec tech motif was successfully created.' }
        format.json { render json: @ceramic_dec_tech_motif, status: :created, location: @ceramic_dec_tech_motif }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_dec_tech_motif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_dec_tech_motifs/1
  # PUT /ceramic_dec_tech_motifs/1.json
  def update
    @ceramic_dec_tech_motif = CeramicDecTechMotif.find(params[:id])

    respond_to do |format|
      if @ceramic_dec_tech_motif.update_attributes(params[:ceramic_dec_tech_motif])
        format.html { redirect_to @ceramic_dec_tech_motif, notice: 'Ceramic dec tech motif was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_dec_tech_motif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_dec_tech_motifs/1
  # DELETE /ceramic_dec_tech_motifs/1.json
  def destroy
    @ceramic_dec_tech_motif = CeramicDecTechMotif.find(params[:id])
    @ceramic_dec_tech_motif.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_dec_tech_motifs_url }
      format.json { head :no_content }
    end
  end
end
