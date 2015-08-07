class BoneTaxonCategoriesController < ApplicationController
  # GET /bone_taxon_categories
  # GET /bone_taxon_categories.json
  def index
    @bone_taxon_categories = BoneTaxonCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_taxon_categories }
    end
  end

  # GET /bone_taxon_categories/1
  # GET /bone_taxon_categories/1.json
  def show
    @bone_taxon_category = BoneTaxonCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_taxon_category }
    end
  end

  # GET /bone_taxon_categories/new
  # GET /bone_taxon_categories/new.json
  def new
    @bone_taxon_category = BoneTaxonCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_taxon_category }
    end
  end

  # GET /bone_taxon_categories/1/edit
  def edit
    @bone_taxon_category = BoneTaxonCategory.find(params[:id])
  end

  # POST /bone_taxon_categories
  # POST /bone_taxon_categories.json
  def create
    @bone_taxon_category = BoneTaxonCategory.new(params[:bone_taxon_category])

    respond_to do |format|
      if @bone_taxon_category.save
        format.html { redirect_to @bone_taxon_category, notice: 'Bone taxon category was successfully created.' }
        format.json { render json: @bone_taxon_category, status: :created, location: @bone_taxon_category }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_taxon_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_taxon_categories/1
  # PUT /bone_taxon_categories/1.json
  def update
    @bone_taxon_category = BoneTaxonCategory.find(params[:id])

    respond_to do |format|
      if @bone_taxon_category.update_attributes(params[:bone_taxon_category])
        format.html { redirect_to @bone_taxon_category, notice: 'Bone taxon category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_taxon_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_taxon_categories/1
  # DELETE /bone_taxon_categories/1.json
  def destroy
    @bone_taxon_category = BoneTaxonCategory.find(params[:id])
    @bone_taxon_category.destroy

    respond_to do |format|
      format.html { redirect_to bone_taxon_categories_url }
      format.json { head :no_content }
    end
  end
end
