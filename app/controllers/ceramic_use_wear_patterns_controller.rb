class CeramicUseWearPatternsController < ApplicationController
  # GET /ceramic_use_wear_patterns
  # GET /ceramic_use_wear_patterns.json
  def index
    @ceramic_use_wear_patterns = CeramicUseWearPattern.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_use_wear_patterns }
    end
  end

  # GET /ceramic_use_wear_patterns/1
  # GET /ceramic_use_wear_patterns/1.json
  def show
    @ceramic_use_wear_pattern = CeramicUseWearPattern.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_use_wear_pattern }
    end
  end

  # GET /ceramic_use_wear_patterns/new
  # GET /ceramic_use_wear_patterns/new.json
  def new
    @ceramic_use_wear_pattern = CeramicUseWearPattern.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_use_wear_pattern }
    end
  end

  # GET /ceramic_use_wear_patterns/1/edit
  def edit
    @ceramic_use_wear_pattern = CeramicUseWearPattern.find(params[:id])
  end

  # POST /ceramic_use_wear_patterns
  # POST /ceramic_use_wear_patterns.json
  def create
    @ceramic_use_wear_pattern = CeramicUseWearPattern.new(params[:ceramic_use_wear_pattern])

    respond_to do |format|
      if @ceramic_use_wear_pattern.save
        format.html { redirect_to @ceramic_use_wear_pattern, notice: 'Ceramic use wear pattern was successfully created.' }
        format.json { render json: @ceramic_use_wear_pattern, status: :created, location: @ceramic_use_wear_pattern }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_use_wear_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_use_wear_patterns/1
  # PUT /ceramic_use_wear_patterns/1.json
  def update
    @ceramic_use_wear_pattern = CeramicUseWearPattern.find(params[:id])

    respond_to do |format|
      if @ceramic_use_wear_pattern.update_attributes(params[:ceramic_use_wear_pattern])
        format.html { redirect_to @ceramic_use_wear_pattern, notice: 'Ceramic use wear pattern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_use_wear_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_use_wear_patterns/1
  # DELETE /ceramic_use_wear_patterns/1.json
  def destroy
    @ceramic_use_wear_pattern = CeramicUseWearPattern.find(params[:id])
    @ceramic_use_wear_pattern.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_use_wear_patterns_url }
      format.json { head :no_content }
    end
  end
end
