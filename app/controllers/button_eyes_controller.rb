class ButtonEyesController < ApplicationController
  # GET /button_eyes
  # GET /button_eyes.json
  def index
    @button_eyes = ButtonEye.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_eyes }
    end
  end

  # GET /button_eyes/1
  # GET /button_eyes/1.json
  def show
    @button_eye = ButtonEye.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_eye }
    end
  end

  # GET /button_eyes/new
  # GET /button_eyes/new.json
  def new
    @button_eye = ButtonEye.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_eye }
    end
  end

  # GET /button_eyes/1/edit
  def edit
    @button_eye = ButtonEye.find(params[:id])
  end

  # POST /button_eyes
  # POST /button_eyes.json
  def create
    @button_eye = ButtonEye.new(params[:button_eye])

    respond_to do |format|
      if @button_eye.save
        format.html { redirect_to @button_eye, notice: 'Button eye was successfully created.' }
        format.json { render json: @button_eye, status: :created, location: @button_eye }
      else
        format.html { render action: "new" }
        format.json { render json: @button_eye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_eyes/1
  # PUT /button_eyes/1.json
  def update
    @button_eye = ButtonEye.find(params[:id])

    respond_to do |format|
      if @button_eye.update_attributes(params[:button_eye])
        format.html { redirect_to @button_eye, notice: 'Button eye was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_eye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_eyes/1
  # DELETE /button_eyes/1.json
  def destroy
    @button_eye = ButtonEye.find(params[:id])
    @button_eye.destroy

    respond_to do |format|
      format.html { redirect_to button_eyes_url }
      format.json { head :no_content }
    end
  end
end
