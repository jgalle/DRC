class PlantationsController < ApplicationController
  # GET /plantations
  # GET /plantations.json
  def index
    @plantations = Plantation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plantations }
    end
  end

  # GET /plantations/1
  # GET /plantations/1.json
  def show
    @plantation = Plantation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plantation }
    end
  end

  # GET /plantations/new
  # GET /plantations/new.json
  def new
    @plantation = Plantation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plantation }
    end
  end

  # GET /plantations/1/edit
  def edit
    @plantation = Plantation.find(params[:id])
  end

  # POST /plantations
  # POST /plantations.json
  def create
    @plantation = Plantation.new(params[:plantation])

    respond_to do |format|
      if @plantation.save
        format.html { redirect_to @plantation, notice: 'Plantation was successfully created.' }
        format.json { render json: @plantation, status: :created, location: @plantation }
      else
        format.html { render action: "new" }
        format.json { render json: @plantation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plantations/1
  # PUT /plantations/1.json
  def update
    @plantation = Plantation.find(params[:id])

    respond_to do |format|
      if @plantation.update_attributes(params[:plantation])
        format.html { redirect_to @plantation, notice: 'Plantation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plantation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plantations/1
  # DELETE /plantations/1.json
  def destroy
    @plantation = Plantation.find(params[:id])
    @plantation.destroy

    respond_to do |format|
      format.html { redirect_to plantations_url }
      format.json { head :no_content }
    end
  end
end
