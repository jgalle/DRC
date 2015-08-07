class GlassMoldTypesController < ApplicationController
  # GET /glass_mold_types
  # GET /glass_mold_types.json
  def index
    @glass_mold_types = GlassMoldType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_mold_types }
    end
  end

  # GET /glass_mold_types/1
  # GET /glass_mold_types/1.json
  def show
    @glass_mold_type = GlassMoldType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_mold_type }
    end
  end

  # GET /glass_mold_types/new
  # GET /glass_mold_types/new.json
  def new
    @glass_mold_type = GlassMoldType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_mold_type }
    end
  end

  # GET /glass_mold_types/1/edit
  def edit
    @glass_mold_type = GlassMoldType.find(params[:id])
  end

  # POST /glass_mold_types
  # POST /glass_mold_types.json
  def create
    @glass_mold_type = GlassMoldType.new(params[:glass_mold_type])

    respond_to do |format|
      if @glass_mold_type.save
        format.html { redirect_to @glass_mold_type, notice: 'Glass mold type was successfully created.' }
        format.json { render json: @glass_mold_type, status: :created, location: @glass_mold_type }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_mold_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_mold_types/1
  # PUT /glass_mold_types/1.json
  def update
    @glass_mold_type = GlassMoldType.find(params[:id])

    respond_to do |format|
      if @glass_mold_type.update_attributes(params[:glass_mold_type])
        format.html { redirect_to @glass_mold_type, notice: 'Glass mold type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_mold_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_mold_types/1
  # DELETE /glass_mold_types/1.json
  def destroy
    @glass_mold_type = GlassMoldType.find(params[:id])
    @glass_mold_type.destroy

    respond_to do |format|
      format.html { redirect_to glass_mold_types_url }
      format.json { head :no_content }
    end
  end
end
