class GlassStemwareFootShapesController < ApplicationController
  # GET /glass_stemware_foot_shapes
  # GET /glass_stemware_foot_shapes.json
  def index
    @glass_stemware_foot_shapes = GlassStemwareFootShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_stemware_foot_shapes }
    end
  end

  # GET /glass_stemware_foot_shapes/1
  # GET /glass_stemware_foot_shapes/1.json
  def show
    @glass_stemware_foot_shape = GlassStemwareFootShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_stemware_foot_shape }
    end
  end

  # GET /glass_stemware_foot_shapes/new
  # GET /glass_stemware_foot_shapes/new.json
  def new
    @glass_stemware_foot_shape = GlassStemwareFootShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_stemware_foot_shape }
    end
  end

  # GET /glass_stemware_foot_shapes/1/edit
  def edit
    @glass_stemware_foot_shape = GlassStemwareFootShape.find(params[:id])
  end

  # POST /glass_stemware_foot_shapes
  # POST /glass_stemware_foot_shapes.json
  def create
    @glass_stemware_foot_shape = GlassStemwareFootShape.new(params[:glass_stemware_foot_shape])

    respond_to do |format|
      if @glass_stemware_foot_shape.save
        format.html { redirect_to @glass_stemware_foot_shape, notice: 'Glass stemware foot shape was successfully created.' }
        format.json { render json: @glass_stemware_foot_shape, status: :created, location: @glass_stemware_foot_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_stemware_foot_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_stemware_foot_shapes/1
  # PUT /glass_stemware_foot_shapes/1.json
  def update
    @glass_stemware_foot_shape = GlassStemwareFootShape.find(params[:id])

    respond_to do |format|
      if @glass_stemware_foot_shape.update_attributes(params[:glass_stemware_foot_shape])
        format.html { redirect_to @glass_stemware_foot_shape, notice: 'Glass stemware foot shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_stemware_foot_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_stemware_foot_shapes/1
  # DELETE /glass_stemware_foot_shapes/1.json
  def destroy
    @glass_stemware_foot_shape = GlassStemwareFootShape.find(params[:id])
    @glass_stemware_foot_shape.destroy

    respond_to do |format|
      format.html { redirect_to glass_stemware_foot_shapes_url }
      format.json { head :no_content }
    end
  end
end
