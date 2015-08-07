class GenObjectFormsController < ApplicationController
  # GET /gen_object_forms
  # GET /gen_object_forms.json
  def index
    @gen_object_forms = GenObjectForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_forms }
    end
  end

  # GET /gen_object_forms/1
  # GET /gen_object_forms/1.json
  def show
    @gen_object_form = GenObjectForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_form }
    end
  end

  # GET /gen_object_forms/new
  # GET /gen_object_forms/new.json
  def new
    @gen_object_form = GenObjectForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_form }
    end
  end

  # GET /gen_object_forms/1/edit
  def edit
    @gen_object_form = GenObjectForm.find(params[:id])
  end

  # POST /gen_object_forms
  # POST /gen_object_forms.json
  def create
    @gen_object_form = GenObjectForm.new(params[:gen_object_form])

    respond_to do |format|
      if @gen_object_form.save
        format.html { redirect_to @gen_object_form, notice: 'Gen object form was successfully created.' }
        format.json { render json: @gen_object_form, status: :created, location: @gen_object_form }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_forms/1
  # PUT /gen_object_forms/1.json
  def update
    @gen_object_form = GenObjectForm.find(params[:id])

    respond_to do |format|
      if @gen_object_form.update_attributes(params[:gen_object_form])
        format.html { redirect_to @gen_object_form, notice: 'Gen object form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_forms/1
  # DELETE /gen_object_forms/1.json
  def destroy
    @gen_object_form = GenObjectForm.find(params[:id])
    @gen_object_form.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_forms_url }
      format.json { head :no_content }
    end
  end
end
