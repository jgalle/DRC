class CeramicRimFormsController < ApplicationController
  # GET /ceramic_rim_forms
  # GET /ceramic_rim_forms.json
  def index
    @ceramic_rim_forms = CeramicRimForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_rim_forms }
    end
  end

  # GET /ceramic_rim_forms/1
  # GET /ceramic_rim_forms/1.json
  def show
    @ceramic_rim_form = CeramicRimForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_rim_form }
    end
  end

  # GET /ceramic_rim_forms/new
  # GET /ceramic_rim_forms/new.json
  def new
    @ceramic_rim_form = CeramicRimForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_rim_form }
    end
  end

  # GET /ceramic_rim_forms/1/edit
  def edit
    @ceramic_rim_form = CeramicRimForm.find(params[:id])
  end

  # POST /ceramic_rim_forms
  # POST /ceramic_rim_forms.json
  def create
    @ceramic_rim_form = CeramicRimForm.new(params[:ceramic_rim_form])

    respond_to do |format|
      if @ceramic_rim_form.save
        format.html { redirect_to @ceramic_rim_form, notice: 'Ceramic rim form was successfully created.' }
        format.json { render json: @ceramic_rim_form, status: :created, location: @ceramic_rim_form }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_rim_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_rim_forms/1
  # PUT /ceramic_rim_forms/1.json
  def update
    @ceramic_rim_form = CeramicRimForm.find(params[:id])

    respond_to do |format|
      if @ceramic_rim_form.update_attributes(params[:ceramic_rim_form])
        format.html { redirect_to @ceramic_rim_form, notice: 'Ceramic rim form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_rim_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_rim_forms/1
  # DELETE /ceramic_rim_forms/1.json
  def destroy
    @ceramic_rim_form = CeramicRimForm.find(params[:id])
    @ceramic_rim_form.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_rim_forms_url }
      format.json { head :no_content }
    end
  end
end
