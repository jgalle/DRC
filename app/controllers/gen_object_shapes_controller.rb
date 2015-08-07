class GenObjectShapesController < ApplicationController
  # GET /gen_object_shapes
  # GET /gen_object_shapes.json
  def index
    @gen_object_shapes = GenObjectShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_shapes }
    end
  end

  # GET /gen_object_shapes/1
  # GET /gen_object_shapes/1.json
  def show
    @gen_object_shape = GenObjectShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_shape }
    end
  end

  # GET /gen_object_shapes/new
  # GET /gen_object_shapes/new.json
  def new
    @gen_object_shape = GenObjectShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_shape }
    end
  end

  # GET /gen_object_shapes/1/edit
  def edit
    @gen_object_shape = GenObjectShape.find(params[:id])
  end

  # POST /gen_object_shapes
  # POST /gen_object_shapes.json
  def create
    @gen_object_shape = GenObjectShape.new(params[:gen_object_shape])

    respond_to do |format|
      if @gen_object_shape.save
        format.html { redirect_to @gen_object_shape, notice: 'Gen object shape was successfully created.' }
        format.json { render json: @gen_object_shape, status: :created, location: @gen_object_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_shapes/1
  # PUT /gen_object_shapes/1.json
  def update
    @gen_object_shape = GenObjectShape.find(params[:id])

    respond_to do |format|
      if @gen_object_shape.update_attributes(params[:gen_object_shape])
        format.html { redirect_to @gen_object_shape, notice: 'Gen object shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_shapes/1
  # DELETE /gen_object_shapes/1.json
  def destroy
    @gen_object_shape = GenObjectShape.find(params[:id])
    @gen_object_shape.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_shapes_url }
      format.json { head :no_content }
    end
  end
end
