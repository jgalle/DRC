class TobaccoPipeMouthpieceFormsController < ApplicationController
  # GET /tobacco_pipe_mouthpiece_forms
  # GET /tobacco_pipe_mouthpiece_forms.json
  def index
    @tobacco_pipe_mouthpiece_forms = TobaccoPipeMouthpieceForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_mouthpiece_forms }
    end
  end

  # GET /tobacco_pipe_mouthpiece_forms/1
  # GET /tobacco_pipe_mouthpiece_forms/1.json
  def show
    @tobacco_pipe_mouthpiece_form = TobaccoPipeMouthpieceForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_mouthpiece_form }
    end
  end

  # GET /tobacco_pipe_mouthpiece_forms/new
  # GET /tobacco_pipe_mouthpiece_forms/new.json
  def new
    @tobacco_pipe_mouthpiece_form = TobaccoPipeMouthpieceForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_mouthpiece_form }
    end
  end

  # GET /tobacco_pipe_mouthpiece_forms/1/edit
  def edit
    @tobacco_pipe_mouthpiece_form = TobaccoPipeMouthpieceForm.find(params[:id])
  end

  # POST /tobacco_pipe_mouthpiece_forms
  # POST /tobacco_pipe_mouthpiece_forms.json
  def create
    @tobacco_pipe_mouthpiece_form = TobaccoPipeMouthpieceForm.new(params[:tobacco_pipe_mouthpiece_form])

    respond_to do |format|
      if @tobacco_pipe_mouthpiece_form.save
        format.html { redirect_to @tobacco_pipe_mouthpiece_form, notice: 'Tobacco pipe mouthpiece form was successfully created.' }
        format.json { render json: @tobacco_pipe_mouthpiece_form, status: :created, location: @tobacco_pipe_mouthpiece_form }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_mouthpiece_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_mouthpiece_forms/1
  # PUT /tobacco_pipe_mouthpiece_forms/1.json
  def update
    @tobacco_pipe_mouthpiece_form = TobaccoPipeMouthpieceForm.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_mouthpiece_form.update_attributes(params[:tobacco_pipe_mouthpiece_form])
        format.html { redirect_to @tobacco_pipe_mouthpiece_form, notice: 'Tobacco pipe mouthpiece form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_mouthpiece_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_mouthpiece_forms/1
  # DELETE /tobacco_pipe_mouthpiece_forms/1.json
  def destroy
    @tobacco_pipe_mouthpiece_form = TobaccoPipeMouthpieceForm.find(params[:id])
    @tobacco_pipe_mouthpiece_form.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_mouthpiece_forms_url }
      format.json { head :no_content }
    end
  end
end
