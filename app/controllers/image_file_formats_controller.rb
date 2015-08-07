class ImageFileFormatsController < ApplicationController
  before_action :set_image_file_format, only: [:show, :edit, :update, :destroy]

  # GET /image_file_formats
  # GET /image_file_formats.json
  def index
    @image_file_formats = ImageFileFormat.all
  end

  # GET /image_file_formats/1
  # GET /image_file_formats/1.json
  def show
  end

  # GET /image_file_formats/new
  def new
    @image_file_format = ImageFileFormat.new
  end

  # GET /image_file_formats/1/edit
  def edit
  end

  # POST /image_file_formats
  # POST /image_file_formats.json
  def create
    @image_file_format = ImageFileFormat.new(image_file_format_params)

    respond_to do |format|
      if @image_file_format.save
        format.html { redirect_to @image_file_format, notice: 'Image file format was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image_file_format }
      else
        format.html { render action: 'new' }
        format.json { render json: @image_file_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_file_formats/1
  # PATCH/PUT /image_file_formats/1.json
  def update
    respond_to do |format|
      if @image_file_format.update(image_file_format_params)
        format.html { redirect_to @image_file_format, notice: 'Image file format was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_file_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_file_formats/1
  # DELETE /image_file_formats/1.json
  def destroy
    @image_file_format.destroy
    respond_to do |format|
      format.html { redirect_to image_file_formats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_file_format
      @image_file_format = ImageFileFormat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_file_format_params
      params.require(:image_file_format).permit(:ImageFileFormat)
    end
end
