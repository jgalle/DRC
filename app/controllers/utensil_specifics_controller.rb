class UtensilSpecificsController < ApplicationController
  # GET /utensil_specifics
  # GET /utensil_specifics.json
  def index
    @utensil_specifics = UtensilSpecific.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensil_specifics }
    end
  end

  # GET /utensil_specifics/1
  # GET /utensil_specifics/1.json
  def show
    @utensil_specific = UtensilSpecific.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil_specific }
    end
  end

  # GET /utensil_specifics/new
  # GET /utensil_specifics/new.json
  def new
    @utensil_specific = UtensilSpecific.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utensil_specific }
    end
  end

  # GET /utensil_specifics/1/edit
  def edit
    @utensil_specific = UtensilSpecific.find(params[:id])
  end

  # POST /utensil_specifics
  # POST /utensil_specifics.json
  def create
    @utensil_specific = UtensilSpecific.new(params[:utensil_specific])

    respond_to do |format|
      if @utensil_specific.save
        format.html { redirect_to @utensil_specific, notice: 'Utensil specific was successfully created.' }
        format.json { render json: @utensil_specific, status: :created, location: @utensil_specific }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil_specific.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensil_specifics/1
  # PUT /utensil_specifics/1.json
  def update
    @utensil_specific = UtensilSpecific.find(params[:id])

    respond_to do |format|
      if @utensil_specific.update_attributes(params[:utensil_specific])
        format.html { redirect_to @utensil_specific, notice: 'Utensil specific was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil_specific.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensil_specifics/1
  # DELETE /utensil_specifics/1.json
  def destroy
    @utensil_specific = UtensilSpecific.find(params[:id])
    @utensil_specific.destroy

    respond_to do |format|
      format.html { redirect_to utensil_specifics_url }
      format.json { head :no_content }
    end
  end
end
