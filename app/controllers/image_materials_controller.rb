class ImageMaterialsController < ApplicationController
  before_action :set_image_material, only: [:show, :edit, :update, :destroy]

  # GET /image_materials
  # GET /image_materials.json
  def index
    @image_materials = ImageMaterial.all
  end

  # GET /image_materials/1
  # GET /image_materials/1.json
  def show
  end

  # GET /image_materials/new
  def new
    @image_material = ImageMaterial.new
  end

  # GET /image_materials/1/edit
  def edit
  end

  # POST /image_materials
  # POST /image_materials.json
  def create
    @image_material = ImageMaterial.new(image_material_params)

    respond_to do |format|
      if @image_material.save
        format.html { redirect_to @image_material, notice: 'Image material was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image_material }
      else
        format.html { render action: 'new' }
        format.json { render json: @image_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_materials/1
  # PATCH/PUT /image_materials/1.json
  def update
    respond_to do |format|
      if @image_material.update(image_material_params)
        format.html { redirect_to @image_material, notice: 'Image material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_materials/1
  # DELETE /image_materials/1.json
  def destroy
    @image_material.destroy
    respond_to do |format|
      format.html { redirect_to image_materials_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_material
      @image_material = ImageMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_material_params
      params.require(:image_material).permit(:ImageMaterial)
    end
end
