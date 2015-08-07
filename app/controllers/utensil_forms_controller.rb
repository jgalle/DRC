class UtensilFormsController < ApplicationController
  # GET /utensil_forms
  # GET /utensil_forms.json
  def index
    @utensil_forms = UtensilForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensil_forms }
    end
  end

  # GET /utensil_forms/1
  # GET /utensil_forms/1.json
  def show
    @utensil_form = UtensilForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil_form }
    end
  end

  # GET /utensil_forms/new
  # GET /utensil_forms/new.json
  def new
    @utensil_form = UtensilForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utensil_form }
    end
  end

  # GET /utensil_forms/1/edit
  def edit
    @utensil_form = UtensilForm.find(params[:id])
  end

  # POST /utensil_forms
  # POST /utensil_forms.json
  def create
    @utensil_form = UtensilForm.new(params[:utensil_form])

    respond_to do |format|
      if @utensil_form.save
        format.html { redirect_to @utensil_form, notice: 'Utensil form was successfully created.' }
        format.json { render json: @utensil_form, status: :created, location: @utensil_form }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensil_forms/1
  # PUT /utensil_forms/1.json
  def update
    @utensil_form = UtensilForm.find(params[:id])

    respond_to do |format|
      if @utensil_form.update_attributes(params[:utensil_form])
        format.html { redirect_to @utensil_form, notice: 'Utensil form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensil_forms/1
  # DELETE /utensil_forms/1.json
  def destroy
    @utensil_form = UtensilForm.find(params[:id])
    @utensil_form.destroy

    respond_to do |format|
      format.html { redirect_to utensil_forms_url }
      format.json { head :no_content }
    end
  end
end
