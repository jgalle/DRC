class ButtonManuTechesController < ApplicationController
  # GET /button_manu_teches
  # GET /button_manu_teches.json
  def index
    @button_manu_teches = ButtonManuTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_manu_teches }
    end
  end

  # GET /button_manu_teches/1
  # GET /button_manu_teches/1.json
  def show
    @button_manu_tech = ButtonManuTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_manu_tech }
    end
  end

  # GET /button_manu_teches/new
  # GET /button_manu_teches/new.json
  def new
    @button_manu_tech = ButtonManuTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_manu_tech }
    end
  end

  # GET /button_manu_teches/1/edit
  def edit
    @button_manu_tech = ButtonManuTech.find(params[:id])
  end

  # POST /button_manu_teches
  # POST /button_manu_teches.json
  def create
    @button_manu_tech = ButtonManuTech.new(params[:button_manu_tech])

    respond_to do |format|
      if @button_manu_tech.save
        format.html { redirect_to @button_manu_tech, notice: 'Button manu tech was successfully created.' }
        format.json { render json: @button_manu_tech, status: :created, location: @button_manu_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @button_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_manu_teches/1
  # PUT /button_manu_teches/1.json
  def update
    @button_manu_tech = ButtonManuTech.find(params[:id])

    respond_to do |format|
      if @button_manu_tech.update_attributes(params[:button_manu_tech])
        format.html { redirect_to @button_manu_tech, notice: 'Button manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_manu_teches/1
  # DELETE /button_manu_teches/1.json
  def destroy
    @button_manu_tech = ButtonManuTech.find(params[:id])
    @button_manu_tech.destroy

    respond_to do |format|
      format.html { redirect_to button_manu_teches_url }
      format.json { head :no_content }
    end
  end
end
