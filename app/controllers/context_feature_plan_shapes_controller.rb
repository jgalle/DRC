class ContextFeaturePlanShapesController < ApplicationController
  # GET /context_feature_plan_shapes
  # GET /context_feature_plan_shapes.json
  def index
    @context_feature_plan_shapes = ContextFeaturePlanShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_feature_plan_shapes }
    end
  end

  # GET /context_feature_plan_shapes/1
  # GET /context_feature_plan_shapes/1.json
  def show
    @context_feature_plan_shape = ContextFeaturePlanShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_feature_plan_shape }
    end
  end

  # GET /context_feature_plan_shapes/new
  # GET /context_feature_plan_shapes/new.json
  def new
    @context_feature_plan_shape = ContextFeaturePlanShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_feature_plan_shape }
    end
  end

  # GET /context_feature_plan_shapes/1/edit
  def edit
    @context_feature_plan_shape = ContextFeaturePlanShape.find(params[:id])
  end

  # POST /context_feature_plan_shapes
  # POST /context_feature_plan_shapes.json
  def create
    @context_feature_plan_shape = ContextFeaturePlanShape.new(params[:context_feature_plan_shape])

    respond_to do |format|
      if @context_feature_plan_shape.save
        format.html { redirect_to @context_feature_plan_shape, notice: 'Context feature plan shape was successfully created.' }
        format.json { render json: @context_feature_plan_shape, status: :created, location: @context_feature_plan_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @context_feature_plan_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_feature_plan_shapes/1
  # PUT /context_feature_plan_shapes/1.json
  def update
    @context_feature_plan_shape = ContextFeaturePlanShape.find(params[:id])

    respond_to do |format|
      if @context_feature_plan_shape.update_attributes(params[:context_feature_plan_shape])
        format.html { redirect_to @context_feature_plan_shape, notice: 'Context feature plan shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_feature_plan_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_feature_plan_shapes/1
  # DELETE /context_feature_plan_shapes/1.json
  def destroy
    @context_feature_plan_shape = ContextFeaturePlanShape.find(params[:id])
    @context_feature_plan_shape.destroy

    respond_to do |format|
      format.html { redirect_to context_feature_plan_shapes_url }
      format.json { head :no_content }
    end
  end
end
