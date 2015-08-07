class CeramicCewbaseFormsController < ApplicationController
  # GET /ceramic_cewbase_forms
  # GET /ceramic_cewbase_forms.json
  def index
    @ceramic_cewbase_forms = CeramicCewbaseForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_cewbase_forms }
    end
  end

  # GET /ceramic_cewbase_forms/1
  # GET /ceramic_cewbase_forms/1.json
  def show
    @ceramic_cewbase_form = CeramicCewbaseForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_cewbase_form }
    end
  end

  # GET /ceramic_cewbase_forms/new
  # GET /ceramic_cewbase_forms/new.json
  def new
    @ceramic_cewbase_form = CeramicCewbaseForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_cewbase_form }
    end
  end

  # GET /ceramic_cewbase_forms/1/edit
  def edit
    @ceramic_cewbase_form = CeramicCewbaseForm.find(params[:id])
  end

  # POST /ceramic_cewbase_forms
  # POST /ceramic_cewbase_forms.json
  def create
    @ceramic_cewbase_form = CeramicCewbaseForm.new(params[:ceramic_cewbase_form])

    respond_to do |format|
      if @ceramic_cewbase_form.save
        format.html { redirect_to @ceramic_cewbase_form, notice: 'Ceramic cewbase form was successfully created.' }
        format.json { render json: @ceramic_cewbase_form, status: :created, location: @ceramic_cewbase_form }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_cewbase_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_cewbase_forms/1
  # PUT /ceramic_cewbase_forms/1.json
  def update
    @ceramic_cewbase_form = CeramicCewbaseForm.find(params[:id])

    respond_to do |format|
      if @ceramic_cewbase_form.update_attributes(params[:ceramic_cewbase_form])
        format.html { redirect_to @ceramic_cewbase_form, notice: 'Ceramic cewbase form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_cewbase_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_cewbase_forms/1
  # DELETE /ceramic_cewbase_forms/1.json
  def destroy
    @ceramic_cewbase_form = CeramicCewbaseForm.find(params[:id])
    @ceramic_cewbase_form.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_cewbase_forms_url }
      format.json { head :no_content }
    end
  end
end
