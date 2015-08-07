class TobaccoPipeMotifTextLocationsController < ApplicationController
  # GET /tobacco_pipe_motif_text_locations
  # GET /tobacco_pipe_motif_text_locations.json
  def index
    @tobacco_pipe_motif_text_locations = TobaccoPipeMotifTextLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_motif_text_locations }
    end
  end

  # GET /tobacco_pipe_motif_text_locations/1
  # GET /tobacco_pipe_motif_text_locations/1.json
  def show
    @tobacco_pipe_motif_text_location = TobaccoPipeMotifTextLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_motif_text_location }
    end
  end

  # GET /tobacco_pipe_motif_text_locations/new
  # GET /tobacco_pipe_motif_text_locations/new.json
  def new
    @tobacco_pipe_motif_text_location = TobaccoPipeMotifTextLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_motif_text_location }
    end
  end

  # GET /tobacco_pipe_motif_text_locations/1/edit
  def edit
    @tobacco_pipe_motif_text_location = TobaccoPipeMotifTextLocation.find(params[:id])
  end

  # POST /tobacco_pipe_motif_text_locations
  # POST /tobacco_pipe_motif_text_locations.json
  def create
    @tobacco_pipe_motif_text_location = TobaccoPipeMotifTextLocation.new(params[:tobacco_pipe_motif_text_location])

    respond_to do |format|
      if @tobacco_pipe_motif_text_location.save
        format.html { redirect_to @tobacco_pipe_motif_text_location, notice: 'Tobacco pipe motif text location was successfully created.' }
        format.json { render json: @tobacco_pipe_motif_text_location, status: :created, location: @tobacco_pipe_motif_text_location }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_motif_text_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_motif_text_locations/1
  # PUT /tobacco_pipe_motif_text_locations/1.json
  def update
    @tobacco_pipe_motif_text_location = TobaccoPipeMotifTextLocation.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_motif_text_location.update_attributes(params[:tobacco_pipe_motif_text_location])
        format.html { redirect_to @tobacco_pipe_motif_text_location, notice: 'Tobacco pipe motif text location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_motif_text_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_motif_text_locations/1
  # DELETE /tobacco_pipe_motif_text_locations/1.json
  def destroy
    @tobacco_pipe_motif_text_location = TobaccoPipeMotifTextLocation.find(params[:id])
    @tobacco_pipe_motif_text_location.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_motif_text_locations_url }
      format.json { head :no_content }
    end
  end
end
