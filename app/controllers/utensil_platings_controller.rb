class UtensilPlatingsController < ApplicationController
  # GET /utensil_platings
  # GET /utensil_platings.json
  def index
    @utensil_platings = UtensilPlating.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensil_platings }
    end
  end

  # GET /utensil_platings/1
  # GET /utensil_platings/1.json
  def show
    @utensil_plating = UtensilPlating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil_plating }
    end
  end

  # GET /utensil_platings/new
  # GET /utensil_platings/new.json
  def new
    @utensil_plating = UtensilPlating.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utensil_plating }
    end
  end

  # GET /utensil_platings/1/edit
  def edit
    @utensil_plating = UtensilPlating.find(params[:id])
  end

  # POST /utensil_platings
  # POST /utensil_platings.json
  def create
    @utensil_plating = UtensilPlating.new(params[:utensil_plating])

    respond_to do |format|
      if @utensil_plating.save
        format.html { redirect_to @utensil_plating, notice: 'Utensil plating was successfully created.' }
        format.json { render json: @utensil_plating, status: :created, location: @utensil_plating }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil_plating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensil_platings/1
  # PUT /utensil_platings/1.json
  def update
    @utensil_plating = UtensilPlating.find(params[:id])

    respond_to do |format|
      if @utensil_plating.update_attributes(params[:utensil_plating])
        format.html { redirect_to @utensil_plating, notice: 'Utensil plating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil_plating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensil_platings/1
  # DELETE /utensil_platings/1.json
  def destroy
    @utensil_plating = UtensilPlating.find(params[:id])
    @utensil_plating.destroy

    respond_to do |format|
      format.html { redirect_to utensil_platings_url }
      format.json { head :no_content }
    end
  end
end
