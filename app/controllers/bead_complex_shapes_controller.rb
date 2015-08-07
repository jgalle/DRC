class BeadComplexShapesController < ApplicationController
  # GET /bead_complex_shapes
  # GET /bead_complex_shapes.json
  def index
    @bead_complex_shapes = BeadComplexShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_complex_shapes }
    end
  end

  # GET /bead_complex_shapes/1
  # GET /bead_complex_shapes/1.json
  def show
    @bead_complex_shape = BeadComplexShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_complex_shape }
    end
  end

  # GET /bead_complex_shapes/new
  # GET /bead_complex_shapes/new.json
  def new
    @bead_complex_shape = BeadComplexShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_complex_shape }
    end
  end

  # GET /bead_complex_shapes/1/edit
  def edit
    @bead_complex_shape = BeadComplexShape.find(params[:id])
  end

  # POST /bead_complex_shapes
  # POST /bead_complex_shapes.json
  def create
    @bead_complex_shape = BeadComplexShape.new(params[:bead_complex_shape])

    respond_to do |format|
      if @bead_complex_shape.save
        format.html { redirect_to @bead_complex_shape, notice: 'Bead complex shape was successfully created.' }
        format.json { render json: @bead_complex_shape, status: :created, location: @bead_complex_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_complex_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_complex_shapes/1
  # PUT /bead_complex_shapes/1.json
  def update
    @bead_complex_shape = BeadComplexShape.find(params[:id])

    respond_to do |format|
      if @bead_complex_shape.update_attributes(params[:bead_complex_shape])
        format.html { redirect_to @bead_complex_shape, notice: 'Bead complex shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_complex_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_complex_shapes/1
  # DELETE /bead_complex_shapes/1.json
  def destroy
    @bead_complex_shape = BeadComplexShape.find(params[:id])
    @bead_complex_shape.destroy

    respond_to do |format|
      format.html { redirect_to bead_complex_shapes_url }
      format.json { head :no_content }
    end
  end
end
