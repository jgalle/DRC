class ImageFormsController < ApplicationController
  before_action :set_image_form, only: [:show, :edit, :update, :destroy]

  # GET /image_forms
  # GET /image_forms.json
  def index
    @image_forms = ImageForm.all
  end

  # GET /image_forms/1
  # GET /image_forms/1.json
  def show
  end

  # GET /image_forms/new
  def new
    @image_form = ImageForm.new
  end

  # GET /image_forms/1/edit
  def edit
  end

  # POST /image_forms
  # POST /image_forms.json
  def create
    @image_form = ImageForm.new(image_form_params)

    respond_to do |format|
      if @image_form.save
        format.html { redirect_to @image_form, notice: 'Image form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @image_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_forms/1
  # PATCH/PUT /image_forms/1.json
  def update
    respond_to do |format|
      if @image_form.update(image_form_params)
        format.html { redirect_to @image_form, notice: 'Image form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_forms/1
  # DELETE /image_forms/1.json
  def destroy
    @image_form.destroy
    respond_to do |format|
      format.html { redirect_to image_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_form
      @image_form = ImageForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_form_params
      params.require(:image_form).permit(:ImageForm)
    end
end
