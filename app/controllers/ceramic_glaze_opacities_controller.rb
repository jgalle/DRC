class CeramicGlazeOpacitiesController < ApplicationController
  # GET /ceramic_glaze_opacities
  # GET /ceramic_glaze_opacities.json
  def index
    @ceramic_glaze_opacities = CeramicGlazeOpacity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_glaze_opacities }
    end
  end

  # GET /ceramic_glaze_opacities/1
  # GET /ceramic_glaze_opacities/1.json
  def show
    @ceramic_glaze_opacity = CeramicGlazeOpacity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_glaze_opacity }
    end
  end

  # GET /ceramic_glaze_opacities/new
  # GET /ceramic_glaze_opacities/new.json
  def new
    @ceramic_glaze_opacity = CeramicGlazeOpacity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_glaze_opacity }
    end
  end

  # GET /ceramic_glaze_opacities/1/edit
  def edit
    @ceramic_glaze_opacity = CeramicGlazeOpacity.find(params[:id])
  end

  # POST /ceramic_glaze_opacities
  # POST /ceramic_glaze_opacities.json
  def create
    @ceramic_glaze_opacity = CeramicGlazeOpacity.new(params[:ceramic_glaze_opacity])

    respond_to do |format|
      if @ceramic_glaze_opacity.save
        format.html { redirect_to @ceramic_glaze_opacity, notice: 'Ceramic glaze opacity was successfully created.' }
        format.json { render json: @ceramic_glaze_opacity, status: :created, location: @ceramic_glaze_opacity }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_glaze_opacity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_glaze_opacities/1
  # PUT /ceramic_glaze_opacities/1.json
  def update
    @ceramic_glaze_opacity = CeramicGlazeOpacity.find(params[:id])

    respond_to do |format|
      if @ceramic_glaze_opacity.update_attributes(params[:ceramic_glaze_opacity])
        format.html { redirect_to @ceramic_glaze_opacity, notice: 'Ceramic glaze opacity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_glaze_opacity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_glaze_opacities/1
  # DELETE /ceramic_glaze_opacities/1.json
  def destroy
    @ceramic_glaze_opacity = CeramicGlazeOpacity.find(params[:id])
    @ceramic_glaze_opacity.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_glaze_opacities_url }
      format.json { head :no_content }
    end
  end
end
