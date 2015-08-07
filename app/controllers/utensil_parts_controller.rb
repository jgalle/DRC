class UtensilPartsController < ApplicationController
  # GET /utensil_parts
  # GET /utensil_parts.json
  def index
    @utensil_parts = UtensilPart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensil_parts }
    end
  end

  # GET /utensil_parts/1
  # GET /utensil_parts/1.json
  def show
    @utensil_part = UtensilPart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil_part }
    end
  end

  # GET /utensil_parts/new
  # GET /utensil_parts/new.json
  def new
    @utensil_part = UtensilPart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utensil_part }
    end
  end

  # GET /utensil_parts/1/edit
  def edit
    @utensil_part = UtensilPart.find(params[:id])
  end

  # POST /utensil_parts
  # POST /utensil_parts.json
  def create
    @utensil_part = UtensilPart.new(params[:utensil_part])

    respond_to do |format|
      if @utensil_part.save
        format.html { redirect_to @utensil_part, notice: 'Utensil part was successfully created.' }
        format.json { render json: @utensil_part, status: :created, location: @utensil_part }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensil_parts/1
  # PUT /utensil_parts/1.json
  def update
    @utensil_part = UtensilPart.find(params[:id])

    respond_to do |format|
      if @utensil_part.update_attributes(params[:utensil_part])
        format.html { redirect_to @utensil_part, notice: 'Utensil part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensil_parts/1
  # DELETE /utensil_parts/1.json
  def destroy
    @utensil_part = UtensilPart.find(params[:id])
    @utensil_part.destroy

    respond_to do |format|
      format.html { redirect_to utensil_parts_url }
      format.json { head :no_content }
    end
  end
end
