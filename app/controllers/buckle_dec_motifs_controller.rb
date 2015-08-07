class BuckleDecMotifsController < ApplicationController
  # GET /buckle_dec_motifs
  # GET /buckle_dec_motifs.json
  def index
    @buckle_dec_motifs = BuckleDecMotif.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_dec_motifs }
    end
  end

  # GET /buckle_dec_motifs/1
  # GET /buckle_dec_motifs/1.json
  def show
    @buckle_dec_motif = BuckleDecMotif.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_dec_motif }
    end
  end

  # GET /buckle_dec_motifs/new
  # GET /buckle_dec_motifs/new.json
  def new
    @buckle_dec_motif = BuckleDecMotif.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_dec_motif }
    end
  end

  # GET /buckle_dec_motifs/1/edit
  def edit
    @buckle_dec_motif = BuckleDecMotif.find(params[:id])
  end

  # POST /buckle_dec_motifs
  # POST /buckle_dec_motifs.json
  def create
    @buckle_dec_motif = BuckleDecMotif.new(params[:buckle_dec_motif])

    respond_to do |format|
      if @buckle_dec_motif.save
        format.html { redirect_to @buckle_dec_motif, notice: 'Buckle dec motif was successfully created.' }
        format.json { render json: @buckle_dec_motif, status: :created, location: @buckle_dec_motif }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_dec_motif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_dec_motifs/1
  # PUT /buckle_dec_motifs/1.json
  def update
    @buckle_dec_motif = BuckleDecMotif.find(params[:id])

    respond_to do |format|
      if @buckle_dec_motif.update_attributes(params[:buckle_dec_motif])
        format.html { redirect_to @buckle_dec_motif, notice: 'Buckle dec motif was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_dec_motif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_dec_motifs/1
  # DELETE /buckle_dec_motifs/1.json
  def destroy
    @buckle_dec_motif = BuckleDecMotif.find(params[:id])
    @buckle_dec_motif.destroy

    respond_to do |format|
      format.html { redirect_to buckle_dec_motifs_url }
      format.json { head :no_content }
    end
  end
end
