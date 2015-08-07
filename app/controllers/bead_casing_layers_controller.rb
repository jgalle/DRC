class BeadCasingLayersController < ApplicationController
  # GET /bead_casing_layers
  # GET /bead_casing_layers.json
  def index
    @bead_casing_layers = BeadCasingLayer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_casing_layers }
    end
  end

  # GET /bead_casing_layers/1
  # GET /bead_casing_layers/1.json
  def show
    @bead_casing_layer = BeadCasingLayer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_casing_layer }
    end
  end

  # GET /bead_casing_layers/new
  # GET /bead_casing_layers/new.json
  def new
    @bead_casing_layer = BeadCasingLayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_casing_layer }
    end
  end

  # GET /bead_casing_layers/1/edit
  def edit
    @bead_casing_layer = BeadCasingLayer.find(params[:id])
  end

  # POST /bead_casing_layers
  # POST /bead_casing_layers.json
  def create
    @bead_casing_layer = BeadCasingLayer.new(params[:bead_casing_layer])

    respond_to do |format|
      if @bead_casing_layer.save
        format.html { redirect_to @bead_casing_layer, notice: 'Bead casing layer was successfully created.' }
        format.json { render json: @bead_casing_layer, status: :created, location: @bead_casing_layer }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_casing_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_casing_layers/1
  # PUT /bead_casing_layers/1.json
  def update
    @bead_casing_layer = BeadCasingLayer.find(params[:id])

    respond_to do |format|
      if @bead_casing_layer.update_attributes(params[:bead_casing_layer])
        format.html { redirect_to @bead_casing_layer, notice: 'Bead casing layer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_casing_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_casing_layers/1
  # DELETE /bead_casing_layers/1.json
  def destroy
    @bead_casing_layer = BeadCasingLayer.find(params[:id])
    @bead_casing_layer.destroy

    respond_to do |format|
      format.html { redirect_to bead_casing_layers_url }
      format.json { head :no_content }
    end
  end
end
