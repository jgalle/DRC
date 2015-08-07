class GlassBottleShapesController < ApplicationController
  # GET /glass_bottle_shapes
  # GET /glass_bottle_shapes.json
  def index
    @glass_bottle_shapes = GlassBottleShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_bottle_shapes }
    end
  end

  # GET /glass_bottle_shapes/1
  # GET /glass_bottle_shapes/1.json
  def show
    @glass_bottle_shape = GlassBottleShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_bottle_shape }
    end
  end

  # GET /glass_bottle_shapes/new
  # GET /glass_bottle_shapes/new.json
  def new
    @glass_bottle_shape = GlassBottleShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_bottle_shape }
    end
  end

  # GET /glass_bottle_shapes/1/edit
  def edit
    @glass_bottle_shape = GlassBottleShape.find(params[:id])
  end

  # POST /glass_bottle_shapes
  # POST /glass_bottle_shapes.json
  def create
    @glass_bottle_shape = GlassBottleShape.new(params[:glass_bottle_shape])

    respond_to do |format|
      if @glass_bottle_shape.save
        format.html { redirect_to @glass_bottle_shape, notice: 'Glass bottle shape was successfully created.' }
        format.json { render json: @glass_bottle_shape, status: :created, location: @glass_bottle_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_bottle_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_bottle_shapes/1
  # PUT /glass_bottle_shapes/1.json
  def update
    @glass_bottle_shape = GlassBottleShape.find(params[:id])

    respond_to do |format|
      if @glass_bottle_shape.update_attributes(params[:glass_bottle_shape])
        format.html { redirect_to @glass_bottle_shape, notice: 'Glass bottle shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_bottle_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_bottle_shapes/1
  # DELETE /glass_bottle_shapes/1.json
  def destroy
    @glass_bottle_shape = GlassBottleShape.find(params[:id])
    @glass_bottle_shape.destroy

    respond_to do |format|
      format.html { redirect_to glass_bottle_shapes_url }
      format.json { head :no_content }
    end
  end
end
