class BeadShapesController < ApplicationController
  # GET /bead_shapes
  # GET /bead_shapes.json
  def index
    @bead_shapes = BeadShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_shapes }
    end
  end

  # GET /bead_shapes/1
  # GET /bead_shapes/1.json
  def show
    @bead_shape = BeadShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_shape }
    end
  end

  # GET /bead_shapes/new
  # GET /bead_shapes/new.json
  def new
    @bead_shape = BeadShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_shape }
    end
  end

  # GET /bead_shapes/1/edit
  def edit
    @bead_shape = BeadShape.find(params[:id])
  end

  # POST /bead_shapes
  # POST /bead_shapes.json
  def create
    @bead_shape = BeadShape.new(params[:bead_shape])

    respond_to do |format|
      if @bead_shape.save
        format.html { redirect_to @bead_shape, notice: 'Bead shape was successfully created.' }
        format.json { render json: @bead_shape, status: :created, location: @bead_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_shapes/1
  # PUT /bead_shapes/1.json
  def update
    @bead_shape = BeadShape.find(params[:id])

    respond_to do |format|
      if @bead_shape.update_attributes(params[:bead_shape])
        format.html { redirect_to @bead_shape, notice: 'Bead shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_shapes/1
  # DELETE /bead_shapes/1.json
  def destroy
    @bead_shape = BeadShape.find(params[:id])
    @bead_shape.destroy

    respond_to do |format|
      format.html { redirect_to bead_shapes_url }
      format.json { head :no_content }
    end
  end
end
