class CeramicVesselCategoriesController < ApplicationController
  # GET /ceramic_vessel_categories
  # GET /ceramic_vessel_categories.json
  def index
    @ceramic_vessel_categories = CeramicVesselCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_vessel_categories }
    end
  end

  # GET /ceramic_vessel_categories/1
  # GET /ceramic_vessel_categories/1.json
  def show
    @ceramic_vessel_category = CeramicVesselCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_vessel_category }
    end
  end

  # GET /ceramic_vessel_categories/new
  # GET /ceramic_vessel_categories/new.json
  def new
    @ceramic_vessel_category = CeramicVesselCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_vessel_category }
    end
  end

  # GET /ceramic_vessel_categories/1/edit
  def edit
    @ceramic_vessel_category = CeramicVesselCategory.find(params[:id])
  end

  # POST /ceramic_vessel_categories
  # POST /ceramic_vessel_categories.json
  def create
    @ceramic_vessel_category = CeramicVesselCategory.new(params[:ceramic_vessel_category])

    respond_to do |format|
      if @ceramic_vessel_category.save
        format.html { redirect_to @ceramic_vessel_category, notice: 'Ceramic vessel category was successfully created.' }
        format.json { render json: @ceramic_vessel_category, status: :created, location: @ceramic_vessel_category }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_vessel_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_vessel_categories/1
  # PUT /ceramic_vessel_categories/1.json
  def update
    @ceramic_vessel_category = CeramicVesselCategory.find(params[:id])

    respond_to do |format|
      if @ceramic_vessel_category.update_attributes(params[:ceramic_vessel_category])
        format.html { redirect_to @ceramic_vessel_category, notice: 'Ceramic vessel category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_vessel_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_vessel_categories/1
  # DELETE /ceramic_vessel_categories/1.json
  def destroy
    @ceramic_vessel_category = CeramicVesselCategory.find(params[:id])
    @ceramic_vessel_category.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_vessel_categories_url }
      format.json { head :no_content }
    end
  end
end
