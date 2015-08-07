class ContextFeatureProfileShapesController < ApplicationController
  # GET /context_feature_profile_shapes
  # GET /context_feature_profile_shapes.json
  def index
    @context_feature_profile_shapes = ContextFeatureProfileShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_feature_profile_shapes }
    end
  end

  # GET /context_feature_profile_shapes/1
  # GET /context_feature_profile_shapes/1.json
  def show
    @context_feature_profile_shape = ContextFeatureProfileShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_feature_profile_shape }
    end
  end

  # GET /context_feature_profile_shapes/new
  # GET /context_feature_profile_shapes/new.json
  def new
    @context_feature_profile_shape = ContextFeatureProfileShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_feature_profile_shape }
    end
  end

  # GET /context_feature_profile_shapes/1/edit
  def edit
    @context_feature_profile_shape = ContextFeatureProfileShape.find(params[:id])
  end

  # POST /context_feature_profile_shapes
  # POST /context_feature_profile_shapes.json
  def create
    @context_feature_profile_shape = ContextFeatureProfileShape.new(params[:context_feature_profile_shape])

    respond_to do |format|
      if @context_feature_profile_shape.save
        format.html { redirect_to @context_feature_profile_shape, notice: 'Context feature profile shape was successfully created.' }
        format.json { render json: @context_feature_profile_shape, status: :created, location: @context_feature_profile_shape }
      else
        format.html { render action: "new" }
        format.json { render json: @context_feature_profile_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_feature_profile_shapes/1
  # PUT /context_feature_profile_shapes/1.json
  def update
    @context_feature_profile_shape = ContextFeatureProfileShape.find(params[:id])

    respond_to do |format|
      if @context_feature_profile_shape.update_attributes(params[:context_feature_profile_shape])
        format.html { redirect_to @context_feature_profile_shape, notice: 'Context feature profile shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_feature_profile_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_feature_profile_shapes/1
  # DELETE /context_feature_profile_shapes/1.json
  def destroy
    @context_feature_profile_shape = ContextFeatureProfileShape.find(params[:id])
    @context_feature_profile_shape.destroy

    respond_to do |format|
      format.html { redirect_to context_feature_profile_shapes_url }
      format.json { head :no_content }
    end
  end
end
