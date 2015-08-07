class ImageSubtypesController < ApplicationController
  before_action :set_image_subtype, only: [:show, :edit, :update, :destroy]

  # GET /image_subtypes
  # GET /image_subtypes.json
  def index
    @image_subtypes = ImageSubtype.all
  end

  # GET /image_subtypes/1
  # GET /image_subtypes/1.json
  def show
  end

  # GET /image_subtypes/new
  def new
    @image_subtype = ImageSubtype.new
  end

  # GET /image_subtypes/1/edit
  def edit
  end

  # POST /image_subtypes
  # POST /image_subtypes.json
  def create
    @image_subtype = ImageSubtype.new(image_subtype_params)

    respond_to do |format|
      if @image_subtype.save
        format.html { redirect_to @image_subtype, notice: 'Image subtype was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image_subtype }
      else
        format.html { render action: 'new' }
        format.json { render json: @image_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_subtypes/1
  # PATCH/PUT /image_subtypes/1.json
  def update
    respond_to do |format|
      if @image_subtype.update(image_subtype_params)
        format.html { redirect_to @image_subtype, notice: 'Image subtype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_subtypes/1
  # DELETE /image_subtypes/1.json
  def destroy
    @image_subtype.destroy
    respond_to do |format|
      format.html { redirect_to image_subtypes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_subtype
      @image_subtype = ImageSubtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_subtype_params
      params.require(:image_subtype).permit(:ImageSubtype)
    end
end
