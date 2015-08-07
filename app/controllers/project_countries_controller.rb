class ProjectCountriesController < ApplicationController
  # GET /project_countries
  # GET /project_countries.json
  def index
    @project_countries = ProjectCountry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_countries }
    end
  end

  # GET /project_countries/1
  # GET /project_countries/1.json
  def show
    @project_country = ProjectCountry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_country }
    end
  end

  # GET /project_countries/new
  # GET /project_countries/new.json
  def new
    @project_country = ProjectCountry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_country }
    end
  end

  # GET /project_countries/1/edit
  def edit
    @project_country = ProjectCountry.find(params[:id])
  end

  # POST /project_countries
  # POST /project_countries.json
  def create
    @project_country = ProjectCountry.new(params[:project_country])

    respond_to do |format|
      if @project_country.save
        format.html { redirect_to @project_country, notice: 'Project country was successfully created.' }
        format.json { render json: @project_country, status: :created, location: @project_country }
      else
        format.html { render action: "new" }
        format.json { render json: @project_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_countries/1
  # PUT /project_countries/1.json
  def update
    @project_country = ProjectCountry.find(params[:id])

    respond_to do |format|
      if @project_country.update_attributes(params[:project_country])
        format.html { redirect_to @project_country, notice: 'Project country was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_countries/1
  # DELETE /project_countries/1.json
  def destroy
    @project_country = ProjectCountry.find(params[:id])
    @project_country.destroy

    respond_to do |format|
      format.html { redirect_to project_countries_url }
      format.json { head :no_content }
    end
  end
end
