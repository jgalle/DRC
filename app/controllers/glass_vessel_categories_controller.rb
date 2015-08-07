class GlassVesselCategoriesController < ApplicationController
  # GET /glass_vessel_categories
  # GET /glass_vessel_categories.json
  def index
    @glass_vessel_categories = GlassVesselCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_vessel_categories }
    end
  end

  # GET /glass_vessel_categories/1
  # GET /glass_vessel_categories/1.json
  def show
    @glass_vessel_category = GlassVesselCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_vessel_category }
    end
  end

  # GET /glass_vessel_categories/new
  # GET /glass_vessel_categories/new.json
  def new
    @glass_vessel_category = GlassVesselCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_vessel_category }
    end
  end

  # GET /glass_vessel_categories/1/edit
  def edit
    @glass_vessel_category = GlassVesselCategory.find(params[:id])
  end

  # POST /glass_vessel_categories
  # POST /glass_vessel_categories.json
  def create
    @glass_vessel_category = GlassVesselCategory.new(params[:glass_vessel_category])

    respond_to do |format|
      if @glass_vessel_category.save
        format.html { redirect_to @glass_vessel_category, notice: 'Glass vessel category was successfully created.' }
        format.json { render json: @glass_vessel_category, status: :created, location: @glass_vessel_category }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_vessel_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_vessel_categories/1
  # PUT /glass_vessel_categories/1.json
  def update
    @glass_vessel_category = GlassVesselCategory.find(params[:id])

    respond_to do |format|
      if @glass_vessel_category.update_attributes(params[:glass_vessel_category])
        format.html { redirect_to @glass_vessel_category, notice: 'Glass vessel category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_vessel_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_vessel_categories/1
  # DELETE /glass_vessel_categories/1.json
  def destroy
    @glass_vessel_category = GlassVesselCategory.find(params[:id])
    @glass_vessel_category.destroy

    respond_to do |format|
      format.html { redirect_to glass_vessel_categories_url }
      format.json { head :no_content }
    end
  end
end
