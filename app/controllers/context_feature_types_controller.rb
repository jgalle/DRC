class ContextFeatureTypesController < ApplicationController
  # GET /context_feature_types
  # GET /context_feature_types.json
  def index
    @context_feature_types = ContextFeatureType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_feature_types }
    end
  end

  # GET /context_feature_types/1
  # GET /context_feature_types/1.json
  def show
    @context_feature_type = ContextFeatureType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_feature_type }
    end
  end

  # GET /context_feature_types/new
  # GET /context_feature_types/new.json
  def new
    @context_feature_type = ContextFeatureType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_feature_type }
    end
  end

  # GET /context_feature_types/1/edit
  def edit
    @context_feature_type = ContextFeatureType.find(params[:id])
  end

  # POST /context_feature_types
  # POST /context_feature_types.json
  def create
    @context_feature_type = ContextFeatureType.new(params[:context_feature_type])

    respond_to do |format|
      if @context_feature_type.save
        format.html { redirect_to @context_feature_type, notice: 'Context feature type was successfully created.' }
        format.json { render json: @context_feature_type, status: :created, location: @context_feature_type }
      else
        format.html { render action: "new" }
        format.json { render json: @context_feature_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_feature_types/1
  # PUT /context_feature_types/1.json
  def update
    @context_feature_type = ContextFeatureType.find(params[:id])

    respond_to do |format|
      if @context_feature_type.update_attributes(params[:context_feature_type])
        format.html { redirect_to @context_feature_type, notice: 'Context feature type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_feature_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_feature_types/1
  # DELETE /context_feature_types/1.json
  def destroy
    @context_feature_type = ContextFeatureType.find(params[:id])
    @context_feature_type.destroy

    respond_to do |format|
      format.html { redirect_to context_feature_types_url }
      format.json { head :no_content }
    end
  end
end
