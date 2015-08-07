class GenObjectVesselCategoriesController < ApplicationController
  # GET /gen_object_vessel_categories
  # GET /gen_object_vessel_categories.json
  def index
    @gen_object_vessel_categories = GenObjectVesselCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_vessel_categories }
    end
  end

  # GET /gen_object_vessel_categories/1
  # GET /gen_object_vessel_categories/1.json
  def show
    @gen_object_vessel_category = GenObjectVesselCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_vessel_category }
    end
  end

  # GET /gen_object_vessel_categories/new
  # GET /gen_object_vessel_categories/new.json
  def new
    @gen_object_vessel_category = GenObjectVesselCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_vessel_category }
    end
  end

  # GET /gen_object_vessel_categories/1/edit
  def edit
    @gen_object_vessel_category = GenObjectVesselCategory.find(params[:id])
  end

  # POST /gen_object_vessel_categories
  # POST /gen_object_vessel_categories.json
  def create
    @gen_object_vessel_category = GenObjectVesselCategory.new(params[:gen_object_vessel_category])

    respond_to do |format|
      if @gen_object_vessel_category.save
        format.html { redirect_to @gen_object_vessel_category, notice: 'Gen object vessel category was successfully created.' }
        format.json { render json: @gen_object_vessel_category, status: :created, location: @gen_object_vessel_category }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_vessel_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_vessel_categories/1
  # PUT /gen_object_vessel_categories/1.json
  def update
    @gen_object_vessel_category = GenObjectVesselCategory.find(params[:id])

    respond_to do |format|
      if @gen_object_vessel_category.update_attributes(params[:gen_object_vessel_category])
        format.html { redirect_to @gen_object_vessel_category, notice: 'Gen object vessel category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_vessel_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_vessel_categories/1
  # DELETE /gen_object_vessel_categories/1.json
  def destroy
    @gen_object_vessel_category = GenObjectVesselCategory.find(params[:id])
    @gen_object_vessel_category.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_vessel_categories_url }
      format.json { head :no_content }
    end
  end
end
