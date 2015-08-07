class CeramicCewfootringFormsController < ApplicationController
  # GET /ceramic_cewfootring_forms
  # GET /ceramic_cewfootring_forms.json
  def index
    @ceramic_cewfootring_forms = CeramicCewfootringForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_cewfootring_forms }
    end
  end

  # GET /ceramic_cewfootring_forms/1
  # GET /ceramic_cewfootring_forms/1.json
  def show
    @ceramic_cewfootring_form = CeramicCewfootringForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_cewfootring_form }
    end
  end

  # GET /ceramic_cewfootring_forms/new
  # GET /ceramic_cewfootring_forms/new.json
  def new
    @ceramic_cewfootring_form = CeramicCewfootringForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_cewfootring_form }
    end
  end

  # GET /ceramic_cewfootring_forms/1/edit
  def edit
    @ceramic_cewfootring_form = CeramicCewfootringForm.find(params[:id])
  end

  # POST /ceramic_cewfootring_forms
  # POST /ceramic_cewfootring_forms.json
  def create
    @ceramic_cewfootring_form = CeramicCewfootringForm.new(params[:ceramic_cewfootring_form])

    respond_to do |format|
      if @ceramic_cewfootring_form.save
        format.html { redirect_to @ceramic_cewfootring_form, notice: 'Ceramic cewfootring form was successfully created.' }
        format.json { render json: @ceramic_cewfootring_form, status: :created, location: @ceramic_cewfootring_form }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_cewfootring_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_cewfootring_forms/1
  # PUT /ceramic_cewfootring_forms/1.json
  def update
    @ceramic_cewfootring_form = CeramicCewfootringForm.find(params[:id])

    respond_to do |format|
      if @ceramic_cewfootring_form.update_attributes(params[:ceramic_cewfootring_form])
        format.html { redirect_to @ceramic_cewfootring_form, notice: 'Ceramic cewfootring form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_cewfootring_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_cewfootring_forms/1
  # DELETE /ceramic_cewfootring_forms/1.json
  def destroy
    @ceramic_cewfootring_form = CeramicCewfootringForm.find(params[:id])
    @ceramic_cewfootring_form.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_cewfootring_forms_url }
      format.json { head :no_content }
    end
  end
end
