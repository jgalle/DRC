class BuckleFormsController < ApplicationController
  # GET /buckle_forms
  # GET /buckle_forms.json
  def index
    @buckle_forms = BuckleForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_forms }
    end
  end

  # GET /buckle_forms/1
  # GET /buckle_forms/1.json
  def show
    @buckle_form = BuckleForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_form }
    end
  end

  # GET /buckle_forms/new
  # GET /buckle_forms/new.json
  def new
    @buckle_form = BuckleForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_form }
    end
  end

  # GET /buckle_forms/1/edit
  def edit
    @buckle_form = BuckleForm.find(params[:id])
  end

  # POST /buckle_forms
  # POST /buckle_forms.json
  def create
    @buckle_form = BuckleForm.new(params[:buckle_form])

    respond_to do |format|
      if @buckle_form.save
        format.html { redirect_to @buckle_form, notice: 'Buckle form was successfully created.' }
        format.json { render json: @buckle_form, status: :created, location: @buckle_form }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_forms/1
  # PUT /buckle_forms/1.json
  def update
    @buckle_form = BuckleForm.find(params[:id])

    respond_to do |format|
      if @buckle_form.update_attributes(params[:buckle_form])
        format.html { redirect_to @buckle_form, notice: 'Buckle form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_forms/1
  # DELETE /buckle_forms/1.json
  def destroy
    @buckle_form = BuckleForm.find(params[:id])
    @buckle_form.destroy

    respond_to do |format|
      format.html { redirect_to buckle_forms_url }
      format.json { head :no_content }
    end
  end
end
