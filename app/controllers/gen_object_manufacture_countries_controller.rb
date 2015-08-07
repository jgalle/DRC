class GenObjectManufactureCountriesController < ApplicationController
  # GET /gen_object_manufacture_countries
  # GET /gen_object_manufacture_countries.json
  def index
    @gen_object_manufacture_countries = GenObjectManufactureCountry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_manufacture_countries }
    end
  end

  # GET /gen_object_manufacture_countries/1
  # GET /gen_object_manufacture_countries/1.json
  def show
    @gen_object_manufacture_country = GenObjectManufactureCountry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_manufacture_country }
    end
  end

  # GET /gen_object_manufacture_countries/new
  # GET /gen_object_manufacture_countries/new.json
  def new
    @gen_object_manufacture_country = GenObjectManufactureCountry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_manufacture_country }
    end
  end

  # GET /gen_object_manufacture_countries/1/edit
  def edit
    @gen_object_manufacture_country = GenObjectManufactureCountry.find(params[:id])
  end

  # POST /gen_object_manufacture_countries
  # POST /gen_object_manufacture_countries.json
  def create
    @gen_object_manufacture_country = GenObjectManufactureCountry.new(params[:gen_object_manufacture_country])

    respond_to do |format|
      if @gen_object_manufacture_country.save
        format.html { redirect_to @gen_object_manufacture_country, notice: 'Gen object manufacture country was successfully created.' }
        format.json { render json: @gen_object_manufacture_country, status: :created, location: @gen_object_manufacture_country }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_manufacture_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_manufacture_countries/1
  # PUT /gen_object_manufacture_countries/1.json
  def update
    @gen_object_manufacture_country = GenObjectManufactureCountry.find(params[:id])

    respond_to do |format|
      if @gen_object_manufacture_country.update_attributes(params[:gen_object_manufacture_country])
        format.html { redirect_to @gen_object_manufacture_country, notice: 'Gen object manufacture country was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_manufacture_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_manufacture_countries/1
  # DELETE /gen_object_manufacture_countries/1.json
  def destroy
    @gen_object_manufacture_country = GenObjectManufactureCountry.find(params[:id])
    @gen_object_manufacture_country.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_manufacture_countries_url }
      format.json { head :no_content }
    end
  end
end
