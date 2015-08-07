class TobaccoPipeTextFrameMotifsController < ApplicationController
  # GET /tobacco_pipe_text_frame_motifs
  # GET /tobacco_pipe_text_frame_motifs.json
  def index
    @tobacco_pipe_text_frame_motifs = TobaccoPipeTextFrameMotif.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_text_frame_motifs }
    end
  end

  # GET /tobacco_pipe_text_frame_motifs/1
  # GET /tobacco_pipe_text_frame_motifs/1.json
  def show
    @tobacco_pipe_text_frame_motif = TobaccoPipeTextFrameMotif.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_text_frame_motif }
    end
  end

  # GET /tobacco_pipe_text_frame_motifs/new
  # GET /tobacco_pipe_text_frame_motifs/new.json
  def new
    @tobacco_pipe_text_frame_motif = TobaccoPipeTextFrameMotif.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_text_frame_motif }
    end
  end

  # GET /tobacco_pipe_text_frame_motifs/1/edit
  def edit
    @tobacco_pipe_text_frame_motif = TobaccoPipeTextFrameMotif.find(params[:id])
  end

  # POST /tobacco_pipe_text_frame_motifs
  # POST /tobacco_pipe_text_frame_motifs.json
  def create
    @tobacco_pipe_text_frame_motif = TobaccoPipeTextFrameMotif.new(params[:tobacco_pipe_text_frame_motif])

    respond_to do |format|
      if @tobacco_pipe_text_frame_motif.save
        format.html { redirect_to @tobacco_pipe_text_frame_motif, notice: 'Tobacco pipe text frame motif was successfully created.' }
        format.json { render json: @tobacco_pipe_text_frame_motif, status: :created, location: @tobacco_pipe_text_frame_motif }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_text_frame_motif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_text_frame_motifs/1
  # PUT /tobacco_pipe_text_frame_motifs/1.json
  def update
    @tobacco_pipe_text_frame_motif = TobaccoPipeTextFrameMotif.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_text_frame_motif.update_attributes(params[:tobacco_pipe_text_frame_motif])
        format.html { redirect_to @tobacco_pipe_text_frame_motif, notice: 'Tobacco pipe text frame motif was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_text_frame_motif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_text_frame_motifs/1
  # DELETE /tobacco_pipe_text_frame_motifs/1.json
  def destroy
    @tobacco_pipe_text_frame_motif = TobaccoPipeTextFrameMotif.find(params[:id])
    @tobacco_pipe_text_frame_motif.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_text_frame_motifs_url }
      format.json { head :no_content }
    end
  end
end
