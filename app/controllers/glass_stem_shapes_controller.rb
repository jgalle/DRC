class GlassStemShapesController < ApplicationController
  # GET /glass_stem_shapes
  # GET /glass_stem_shapes.json
  def index
    @glass_stem_shapes = GlassStemShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_stem_shapes }
    end
  end

  # GET /glass_stem_shapes/1
  # GET /glass_stem_shapes/1.json
  def show
    @glass_stem_shape = GlassStemShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_stem_shape }
    end
  end

  # GET /glass_stem_shapes/new
  # GET /glass_stem_shapes/new.json
  def new
    @glass_stem_shape = GlassStemShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_stem_shape }
    end
  end

  # GET /glass_stem_shapes/1/edit
  def edit
    @glass_stem_shape = GlassStemShape.find(params[:id])
  end

  # POST /glass_stem_shapes
  # POST /glass_stem_shapes.json
  def create
    @glass_stem_shape = GlassStemShape.new(params[:glass_stem_shape])

    respond_to do |format|
      if @glass_stem_shape.save
        format.html { redirect_to @glass_stem_shape, notice: 'Glass stem shape was successfully created.' }
        format.json { render json: @glass_stem_shape, status: :created, location: @glass_stem_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_stem_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_stem_shapes/1
  # PUT /glass_stem_shapes/1.json
  def update
    @glass_stem_shape = GlassStemShape.find(params[:id])

    respond_to do |format|
      if @glass_stem_shape.update_attributes(params[:glass_stem_shape])
        format.html { redirect_to @glass_stem_shape, notice: 'Glass stem shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_stem_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_stem_shapes/1
  # DELETE /glass_stem_shapes/1.json
  def destroy
    @glass_stem_shape = GlassStemShape.find(params[:id])
    @glass_stem_shape.destroy

    respond_to do |format|
      format.html { redirect_to glass_stem_shapes_url }
      format.json { head :no_content }
    end
  end
end
