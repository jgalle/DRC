class GlassFormsController < ApplicationController
  # GET /glass_forms
  # GET /glass_forms.json
  def index
    @glass_forms = GlassForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_forms }
    end
  end

  # GET /glass_forms/1
  # GET /glass_forms/1.json
  def show
    @glass_form = GlassForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_form }
    end
  end

  # GET /glass_forms/new
  # GET /glass_forms/new.json
  def new
    @glass_form = GlassForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_form }
    end
  end

  # GET /glass_forms/1/edit
  def edit
    @glass_form = GlassForm.find(params[:id])
  end

  # POST /glass_forms
  # POST /glass_forms.json
  def create
    @glass_form = GlassForm.new(params[:glass_form])

    respond_to do |format|
      if @glass_form.save
        format.html { redirect_to @glass_form, notice: 'Glass form was successfully created.' }
        format.json { render json: @glass_form, status: :created, location: @glass_form }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_forms/1
  # PUT /glass_forms/1.json
  def update
    @glass_form = GlassForm.find(params[:id])

    respond_to do |format|
      if @glass_form.update_attributes(params[:glass_form])
        format.html { redirect_to @glass_form, notice: 'Glass form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_forms/1
  # DELETE /glass_forms/1.json
  def destroy
    @glass_form = GlassForm.find(params[:id])
    @glass_form.destroy

    respond_to do |format|
      format.html { redirect_to glass_forms_url }
      format.json { head :no_content }
    end
  end
end
