class UtensilShapesController < ApplicationController
  # GET /utensil_shapes
  # GET /utensil_shapes.json
  def index
    @utensil_shapes = UtensilShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensil_shapes }
    end
  end

  # GET /utensil_shapes/1
  # GET /utensil_shapes/1.json
  def show
    @utensil_shape = UtensilShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil_shape }
    end
  end

  # GET /utensil_shapes/new
  # GET /utensil_shapes/new.json
  def new
    @utensil_shape = UtensilShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utensil_shape }
    end
  end

  # GET /utensil_shapes/1/edit
  def edit
    @utensil_shape = UtensilShape.find(params[:id])
  end

  # POST /utensil_shapes
  # POST /utensil_shapes.json
  def create
    @utensil_shape = UtensilShape.new(params[:utensil_shape])

    respond_to do |format|
      if @utensil_shape.save
        format.html { redirect_to @utensil_shape, notice: 'Utensil shape was successfully created.' }
        format.json { render json: @utensil_shape, status: :created, location: @utensil_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensil_shapes/1
  # PUT /utensil_shapes/1.json
  def update
    @utensil_shape = UtensilShape.find(params[:id])

    respond_to do |format|
      if @utensil_shape.update_attributes(params[:utensil_shape])
        format.html { redirect_to @utensil_shape, notice: 'Utensil shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensil_shapes/1
  # DELETE /utensil_shapes/1.json
  def destroy
    @utensil_shape = UtensilShape.find(params[:id])
    @utensil_shape.destroy

    respond_to do |format|
      format.html { redirect_to utensil_shapes_url }
      format.json { head :no_content }
    end
  end
end
