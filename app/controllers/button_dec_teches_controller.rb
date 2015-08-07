class ButtonDecTechesController < ApplicationController
  # GET /button_dec_teches
  # GET /button_dec_teches.json
  def index
    @button_dec_teches = ButtonDecTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_dec_teches }
    end
  end

  # GET /button_dec_teches/1
  # GET /button_dec_teches/1.json
  def show
    @button_dec_tech = ButtonDecTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_dec_tech }
    end
  end

  # GET /button_dec_teches/new
  # GET /button_dec_teches/new.json
  def new
    @button_dec_tech = ButtonDecTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_dec_tech }
    end
  end

  # GET /button_dec_teches/1/edit
  def edit
    @button_dec_tech = ButtonDecTech.find(params[:id])
  end

  # POST /button_dec_teches
  # POST /button_dec_teches.json
  def create
    @button_dec_tech = ButtonDecTech.new(params[:button_dec_tech])

    respond_to do |format|
      if @button_dec_tech.save
        format.html { redirect_to @button_dec_tech, notice: 'Button dec tech was successfully created.' }
        format.json { render json: @button_dec_tech, status: :created, location: @button_dec_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @button_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_dec_teches/1
  # PUT /button_dec_teches/1.json
  def update
    @button_dec_tech = ButtonDecTech.find(params[:id])

    respond_to do |format|
      if @button_dec_tech.update_attributes(params[:button_dec_tech])
        format.html { redirect_to @button_dec_tech, notice: 'Button dec tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_dec_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_dec_teches/1
  # DELETE /button_dec_teches/1.json
  def destroy
    @button_dec_tech = ButtonDecTech.find(params[:id])
    @button_dec_tech.destroy

    respond_to do |format|
      format.html { redirect_to button_dec_teches_url }
      format.json { head :no_content }
    end
  end
end
