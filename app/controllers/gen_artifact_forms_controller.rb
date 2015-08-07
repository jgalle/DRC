class GenArtifactFormsController < ApplicationController
  # GET /gen_artifact_forms
  # GET /gen_artifact_forms.json
  def index
    @gen_artifact_forms = GenArtifactForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifact_forms }
    end
  end

  # GET /gen_artifact_forms/1
  # GET /gen_artifact_forms/1.json
  def show
    @gen_artifact_form = GenArtifactForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact_form }
    end
  end

  # GET /gen_artifact_forms/new
  # GET /gen_artifact_forms/new.json
  def new
    @gen_artifact_form = GenArtifactForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_artifact_form }
    end
  end

  # GET /gen_artifact_forms/1/edit
  def edit
    @gen_artifact_form = GenArtifactForm.find(params[:id])
  end

  # POST /gen_artifact_forms
  # POST /gen_artifact_forms.json
  def create
    @gen_artifact_form = GenArtifactForm.new(params[:gen_artifact_form])

    respond_to do |format|
      if @gen_artifact_form.save
        format.html { redirect_to @gen_artifact_form, notice: 'Gen artifact form was successfully created.' }
        format.json { render json: @gen_artifact_form, status: :created, location: @gen_artifact_form }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_artifact_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifact_forms/1
  # PUT /gen_artifact_forms/1.json
  def update
    @gen_artifact_form = GenArtifactForm.find(params[:id])

    respond_to do |format|
      if @gen_artifact_form.update_attributes(params[:gen_artifact_form])
        format.html { redirect_to @gen_artifact_form, notice: 'Gen artifact form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifact_forms/1
  # DELETE /gen_artifact_forms/1.json
  def destroy
    @gen_artifact_form = GenArtifactForm.find(params[:id])
    @gen_artifact_form.destroy

    respond_to do |format|
      format.html { redirect_to gen_artifact_forms_url }
      format.json { head :no_content }
    end
  end
end
