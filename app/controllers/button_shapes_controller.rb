class ButtonShapesController < ApplicationController
  before_action :set_button_shape, only: [:show, :edit, :update, :destroy]

  # GET /button_shapes
  # GET /button_shapes.json
  def index
    @button_shapes = ButtonShape.all
  end

  # GET /button_shapes/1
  # GET /button_shapes/1.json
  def show
  end

  # GET /button_shapes/new
  def new
    @button_shape = ButtonShape.new
  end

  # GET /button_shapes/1/edit
  def edit
  end

  # POST /button_shapes
  # POST /button_shapes.json
  def create
    @button_shape = ButtonShape.new(button_shape_params)

    respond_to do |format|
      if @button_shape.save
        format.html { redirect_to @button_shape, notice: 'Button shape was successfully created.' }
        format.json { render action: 'show', status: :created, location: @button_shape }
      else
        format.html { render action: 'new' }
        format.json { render json: @button_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /button_shapes/1
  # PATCH/PUT /button_shapes/1.json
  def update
    respond_to do |format|
      if @button_shape.update(button_shape_params)
        format.html { redirect_to @button_shape, notice: 'Button shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @button_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_shapes/1
  # DELETE /button_shapes/1.json
  def destroy
    @button_shape.destroy
    respond_to do |format|
      format.html { redirect_to button_shapes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_button_shape
      @button_shape = ButtonShape.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def button_shape_params
      params.require(:button_shape).permit(:ButtonShape)
    end
end
