class CeramicUseWearsController < ApplicationController
  # GET /ceramic_use_wears
  # GET /ceramic_use_wears.json
  def index
    @ceramic_use_wears = CeramicUseWear.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_use_wears }
    end
  end

  # GET /ceramic_use_wears/1
  # GET /ceramic_use_wears/1.json
  def show
    @ceramic_use_wear = CeramicUseWear.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_use_wear }
    end
  end

  # GET /ceramic_use_wears/new
  # GET /ceramic_use_wears/new.json
  def new
    @ceramic_use_wear = CeramicUseWear.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_use_wear }
    end
  end

  # GET /ceramic_use_wears/1/edit
  def edit
    @ceramic_use_wear = CeramicUseWear.find(params[:id])
  end

  # POST /ceramic_use_wears
  # POST /ceramic_use_wears.json
  def create
    @ceramic_use_wear = CeramicUseWear.new(params[:ceramic_use_wear])

    respond_to do |format|
      if @ceramic_use_wear.save
        format.html { redirect_to @ceramic_use_wear, notice: 'Ceramic use wear was successfully created.' }
        format.json { render json: @ceramic_use_wear, status: :created, location: @ceramic_use_wear }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_use_wear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_use_wears/1
  # PUT /ceramic_use_wears/1.json
  def update
    @ceramic_use_wear = CeramicUseWear.find(params[:id])

    respond_to do |format|
      if @ceramic_use_wear.update_attributes(params[:ceramic_use_wear])
        format.html { redirect_to @ceramic_use_wear, notice: 'Ceramic use wear was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_use_wear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_use_wears/1
  # DELETE /ceramic_use_wears/1.json
  def destroy
    @ceramic_use_wear = CeramicUseWear.find(params[:id])
    @ceramic_use_wear.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_use_wears_url }
      format.json { head :no_content }
    end
  end
end
