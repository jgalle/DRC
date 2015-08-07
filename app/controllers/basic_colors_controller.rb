class BasicColorsController < ApplicationController
  before_action :set_basic_color, only: [:show, :edit, :update, :destroy]

  # GET /basic_colors
  # GET /basic_colors.json
  def index
    @basic_colors = BasicColor.all
  end

  # GET /basic_colors/1
  # GET /basic_colors/1.json
  def show
  end

  # GET /basic_colors/new
  def new
    @basic_color = BasicColor.new
  end

  # GET /basic_colors/1/edit
  def edit
  end

  # POST /basic_colors
  # POST /basic_colors.json
  def create
    @basic_color = BasicColor.new(basic_color_params)

    respond_to do |format|
      if @basic_color.save
        format.html { redirect_to @basic_color, notice: 'Basic color was successfully created.' }
        format.json { render action: 'show', status: :created, location: @basic_color }
      else
        format.html { render action: 'new' }
        format.json { render json: @basic_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basic_colors/1
  # PATCH/PUT /basic_colors/1.json
  def update
    respond_to do |format|
      if @basic_color.update(basic_color_params)
        format.html { redirect_to @basic_color, notice: 'Basic color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @basic_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basic_colors/1
  # DELETE /basic_colors/1.json
  def destroy
    @basic_color.destroy
    respond_to do |format|
      format.html { redirect_to basic_colors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_color
      @basic_color = BasicColor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_color_params
      params.require(:basic_color).permit(:BasicColor)
    end
end
