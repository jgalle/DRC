class TobaccoPipeBowlDecMotifsController < ApplicationController
  # GET /tobacco_pipe_bowl_dec_motifs
  # GET /tobacco_pipe_bowl_dec_motifs.json
  def index
    @tobacco_pipe_bowl_dec_motifs = TobaccoPipeBowlDecMotif.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_bowl_dec_motifs }
    end
  end

  # GET /tobacco_pipe_bowl_dec_motifs/1
  # GET /tobacco_pipe_bowl_dec_motifs/1.json
  def show
    @tobacco_pipe_bowl_dec_motif = TobaccoPipeBowlDecMotif.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_bowl_dec_motif }
    end
  end

  # GET /tobacco_pipe_bowl_dec_motifs/new
  # GET /tobacco_pipe_bowl_dec_motifs/new.json
  def new
    @tobacco_pipe_bowl_dec_motif = TobaccoPipeBowlDecMotif.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_bowl_dec_motif }
    end
  end

  # GET /tobacco_pipe_bowl_dec_motifs/1/edit
  def edit
    @tobacco_pipe_bowl_dec_motif = TobaccoPipeBowlDecMotif.find(params[:id])
  end

  # POST /tobacco_pipe_bowl_dec_motifs
  # POST /tobacco_pipe_bowl_dec_motifs.json
  def create
    @tobacco_pipe_bowl_dec_motif = TobaccoPipeBowlDecMotif.new(params[:tobacco_pipe_bowl_dec_motif])

    respond_to do |format|
      if @tobacco_pipe_bowl_dec_motif.save
        format.html { redirect_to @tobacco_pipe_bowl_dec_motif, notice: 'Tobacco pipe bowl dec motif was successfully created.' }
        format.json { render json: @tobacco_pipe_bowl_dec_motif, status: :created, location: @tobacco_pipe_bowl_dec_motif }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_bowl_dec_motif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_bowl_dec_motifs/1
  # PUT /tobacco_pipe_bowl_dec_motifs/1.json
  def update
    @tobacco_pipe_bowl_dec_motif = TobaccoPipeBowlDecMotif.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_bowl_dec_motif.update_attributes(params[:tobacco_pipe_bowl_dec_motif])
        format.html { redirect_to @tobacco_pipe_bowl_dec_motif, notice: 'Tobacco pipe bowl dec motif was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_bowl_dec_motif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_bowl_dec_motifs/1
  # DELETE /tobacco_pipe_bowl_dec_motifs/1.json
  def destroy
    @tobacco_pipe_bowl_dec_motif = TobaccoPipeBowlDecMotif.find(params[:id])
    @tobacco_pipe_bowl_dec_motif.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_bowl_dec_motifs_url }
      format.json { head :no_content }
    end
  end
end
