class WebsiteRegionsController < ApplicationController
  before_action :set_website_region, only: [:show, :edit, :update, :destroy]

  # GET /website_regions
  # GET /website_regions.json
  def index
    @website_regions = WebsiteRegion.all
  end

  # GET /website_regions/1
  # GET /website_regions/1.json
  def show
  end

  # GET /website_regions/new
  def new
    @website_region = WebsiteRegion.new
  end

  # GET /website_regions/1/edit
  def edit
  end

  # POST /website_regions
  # POST /website_regions.json
  def create
    @website_region = WebsiteRegion.new(website_region_params)

    respond_to do |format|
      if @website_region.save
        format.html { redirect_to @website_region, notice: 'Website region was successfully created.' }
        format.json { render action: 'show', status: :created, location: @website_region }
      else
        format.html { render action: 'new' }
        format.json { render json: @website_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /website_regions/1
  # PATCH/PUT /website_regions/1.json
  def update
    respond_to do |format|
      if @website_region.update(website_region_params)
        format.html { redirect_to @website_region, notice: 'Website region was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @website_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /website_regions/1
  # DELETE /website_regions/1.json
  def destroy
    @website_region.destroy
    respond_to do |format|
      format.html { redirect_to website_regions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website_region
      @website_region = WebsiteRegion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def website_region_params
      params.require(:website_region).permit(:WebsiteRegion)
    end
end
