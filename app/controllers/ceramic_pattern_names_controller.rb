class CeramicPatternNamesController < ApplicationController
  # GET /ceramic_pattern_names
  # GET /ceramic_pattern_names.json
  def index
    @ceramic_pattern_names = CeramicPatternName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_pattern_names }
    end
  end

  # GET /ceramic_pattern_names/1
  # GET /ceramic_pattern_names/1.json
  def show
    @ceramic_pattern_name = CeramicPatternName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_pattern_name }
    end
  end

  # GET /ceramic_pattern_names/new
  # GET /ceramic_pattern_names/new.json
  def new
    @ceramic_pattern_name = CeramicPatternName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_pattern_name }
    end
  end

  # GET /ceramic_pattern_names/1/edit
  def edit
    @ceramic_pattern_name = CeramicPatternName.find(params[:id])
  end

  # POST /ceramic_pattern_names
  # POST /ceramic_pattern_names.json
  def create
    @ceramic_pattern_name = CeramicPatternName.new(params[:ceramic_pattern_name])

    respond_to do |format|
      if @ceramic_pattern_name.save
        format.html { redirect_to @ceramic_pattern_name, notice: 'Ceramic pattern name was successfully created.' }
        format.json { render json: @ceramic_pattern_name, status: :created, location: @ceramic_pattern_name }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_pattern_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_pattern_names/1
  # PUT /ceramic_pattern_names/1.json
  def update
    @ceramic_pattern_name = CeramicPatternName.find(params[:id])

    respond_to do |format|
      if @ceramic_pattern_name.update_attributes(params[:ceramic_pattern_name])
        format.html { redirect_to @ceramic_pattern_name, notice: 'Ceramic pattern name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_pattern_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_pattern_names/1
  # DELETE /ceramic_pattern_names/1.json
  def destroy
    @ceramic_pattern_name = CeramicPatternName.find(params[:id])
    @ceramic_pattern_name.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_pattern_names_url }
      format.json { head :no_content }
    end
  end
end
