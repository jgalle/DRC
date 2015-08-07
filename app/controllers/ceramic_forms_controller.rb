class CeramicFormsController < ApplicationController
  # GET /ceramic_forms
  # GET /ceramic_forms.json
  def index
    @ceramic_forms = CeramicForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_forms }
    end
  end

  # GET /ceramic_forms/1
  # GET /ceramic_forms/1.json
  def show
    @ceramic_form = CeramicForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_form }
    end
  end

  # GET /ceramic_forms/new
  # GET /ceramic_forms/new.json
  def new
    @ceramic_form = CeramicForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_form }
    end
  end

  # GET /ceramic_forms/1/edit
  def edit
    @ceramic_form = CeramicForm.find(params[:id])
  end

  # POST /ceramic_forms
  # POST /ceramic_forms.json
  def create
    @ceramic_form = CeramicForm.new(params[:ceramic_form])

    respond_to do |format|
      if @ceramic_form.save
        format.html { redirect_to @ceramic_form, notice: 'Ceramic form was successfully created.' }
        format.json { render json: @ceramic_form, status: :created, location: @ceramic_form }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_forms/1
  # PUT /ceramic_forms/1.json
  def update
    @ceramic_form = CeramicForm.find(params[:id])

    respond_to do |format|
      if @ceramic_form.update_attributes(params[:ceramic_form])
        format.html { redirect_to @ceramic_form, notice: 'Ceramic form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_forms/1
  # DELETE /ceramic_forms/1.json
  def destroy
    @ceramic_form = CeramicForm.find(params[:id])
    @ceramic_form.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_forms_url }
      format.json { head :no_content }
    end
  end
end
