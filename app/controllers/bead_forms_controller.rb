class BeadFormsController < ApplicationController
  # GET /bead_forms
  # GET /bead_forms.json
  def index
    @bead_forms = BeadForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_forms }
    end
  end

  # GET /bead_forms/1
  # GET /bead_forms/1.json
  def show
    @bead_form = BeadForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_form }
    end
  end

  # GET /bead_forms/new
  # GET /bead_forms/new.json
  def new
    @bead_form = BeadForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_form }
    end
  end

  # GET /bead_forms/1/edit
  def edit
    @bead_form = BeadForm.find(params[:id])
  end

  # POST /bead_forms
  # POST /bead_forms.json
  def create
    @bead_form = BeadForm.new(params[:bead_form])

    respond_to do |format|
      if @bead_form.save
        format.html { redirect_to @bead_form, notice: 'Bead form was successfully created.' }
        format.json { render json: @bead_form, status: :created, location: @bead_form }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_forms/1
  # PUT /bead_forms/1.json
  def update
    @bead_form = BeadForm.find(params[:id])

    respond_to do |format|
      if @bead_form.update_attributes(params[:bead_form])
        format.html { redirect_to @bead_form, notice: 'Bead form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_forms/1
  # DELETE /bead_forms/1.json
  def destroy
    @bead_form = BeadForm.find(params[:id])
    @bead_form.destroy

    respond_to do |format|
      format.html { redirect_to bead_forms_url }
      format.json { head :no_content }
    end
  end
end
