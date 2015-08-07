class BuckleShapesController < ApplicationController
  # GET /buckle_shapes
  # GET /buckle_shapes.json
  def index
    @buckle_shapes = BuckleShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_shapes }
    end
  end

  # GET /buckle_shapes/1
  # GET /buckle_shapes/1.json
  def show
    @buckle_shape = BuckleShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_shape }
    end
  end

  # GET /buckle_shapes/new
  # GET /buckle_shapes/new.json
  def new
    @buckle_shape = BuckleShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_shape }
    end
  end

  # GET /buckle_shapes/1/edit
  def edit
    @buckle_shape = BuckleShape.find(params[:id])
  end

  # POST /buckle_shapes
  # POST /buckle_shapes.json
  def create
    @buckle_shape = BuckleShape.new(params[:buckle_shape])

    respond_to do |format|
      if @buckle_shape.save
        format.html { redirect_to @buckle_shape, notice: 'Buckle shape was successfully created.' }
        format.json { render json: @buckle_shape, status: :created, location: @buckle_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_shapes/1
  # PUT /buckle_shapes/1.json
  def update
    @buckle_shape = BuckleShape.find(params[:id])

    respond_to do |format|
      if @buckle_shape.update_attributes(params[:buckle_shape])
        format.html { redirect_to @buckle_shape, notice: 'Buckle shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_shapes/1
  # DELETE /buckle_shapes/1.json
  def destroy
    @buckle_shape = BuckleShape.find(params[:id])
    @buckle_shape.destroy

    respond_to do |format|
      format.html { redirect_to buckle_shapes_url }
      format.json { head :no_content }
    end
  end
end
