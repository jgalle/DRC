class CeramicBurningsController < ApplicationController
  # GET /ceramic_burnings
  # GET /ceramic_burnings.json
  def index
    @ceramic_burnings = CeramicBurning.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_burnings }
    end
  end

  # GET /ceramic_burnings/1
  # GET /ceramic_burnings/1.json
  def show
    @ceramic_burning = CeramicBurning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_burning }
    end
  end

  # GET /ceramic_burnings/new
  # GET /ceramic_burnings/new.json
  def new
    @ceramic_burning = CeramicBurning.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_burning }
    end
  end

  # GET /ceramic_burnings/1/edit
  def edit
    @ceramic_burning = CeramicBurning.find(params[:id])
  end

  # POST /ceramic_burnings
  # POST /ceramic_burnings.json
  def create
    @ceramic_burning = CeramicBurning.new(params[:ceramic_burning])

    respond_to do |format|
      if @ceramic_burning.save
        format.html { redirect_to @ceramic_burning, notice: 'Ceramic burning was successfully created.' }
        format.json { render json: @ceramic_burning, status: :created, location: @ceramic_burning }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_burning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_burnings/1
  # PUT /ceramic_burnings/1.json
  def update
    @ceramic_burning = CeramicBurning.find(params[:id])

    respond_to do |format|
      if @ceramic_burning.update_attributes(params[:ceramic_burning])
        format.html { redirect_to @ceramic_burning, notice: 'Ceramic burning was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_burning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_burnings/1
  # DELETE /ceramic_burnings/1.json
  def destroy
    @ceramic_burning = CeramicBurning.find(params[:id])
    @ceramic_burning.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_burnings_url }
      format.json { head :no_content }
    end
  end
end
