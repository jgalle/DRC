class UtensilManuTechesController < ApplicationController
  # GET /utensil_manu_teches
  # GET /utensil_manu_teches.json
  def index
    @utensil_manu_teches = UtensilManuTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensil_manu_teches }
    end
  end

  # GET /utensil_manu_teches/1
  # GET /utensil_manu_teches/1.json
  def show
    @utensil_manu_tech = UtensilManuTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil_manu_tech }
    end
  end

  # GET /utensil_manu_teches/new
  # GET /utensil_manu_teches/new.json
  def new
    @utensil_manu_tech = UtensilManuTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utensil_manu_tech }
    end
  end

  # GET /utensil_manu_teches/1/edit
  def edit
    @utensil_manu_tech = UtensilManuTech.find(params[:id])
  end

  # POST /utensil_manu_teches
  # POST /utensil_manu_teches.json
  def create
    @utensil_manu_tech = UtensilManuTech.new(params[:utensil_manu_tech])

    respond_to do |format|
      if @utensil_manu_tech.save
        format.html { redirect_to @utensil_manu_tech, notice: 'Utensil manu tech was successfully created.' }
        format.json { render json: @utensil_manu_tech, status: :created, location: @utensil_manu_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensil_manu_teches/1
  # PUT /utensil_manu_teches/1.json
  def update
    @utensil_manu_tech = UtensilManuTech.find(params[:id])

    respond_to do |format|
      if @utensil_manu_tech.update_attributes(params[:utensil_manu_tech])
        format.html { redirect_to @utensil_manu_tech, notice: 'Utensil manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensil_manu_teches/1
  # DELETE /utensil_manu_teches/1.json
  def destroy
    @utensil_manu_tech = UtensilManuTech.find(params[:id])
    @utensil_manu_tech.destroy

    respond_to do |format|
      format.html { redirect_to utensil_manu_teches_url }
      format.json { head :no_content }
    end
  end
end
