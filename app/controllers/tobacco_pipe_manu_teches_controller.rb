class TobaccoPipeManuTechesController < ApplicationController
  # GET /tobacco_pipe_manu_teches
  # GET /tobacco_pipe_manu_teches.json
  def index
    @tobacco_pipe_manu_teches = TobaccoPipeManuTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_manu_teches }
    end
  end

  # GET /tobacco_pipe_manu_teches/1
  # GET /tobacco_pipe_manu_teches/1.json
  def show
    @tobacco_pipe_manu_tech = TobaccoPipeManuTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_manu_tech }
    end
  end

  # GET /tobacco_pipe_manu_teches/new
  # GET /tobacco_pipe_manu_teches/new.json
  def new
    @tobacco_pipe_manu_tech = TobaccoPipeManuTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_manu_tech }
    end
  end

  # GET /tobacco_pipe_manu_teches/1/edit
  def edit
    @tobacco_pipe_manu_tech = TobaccoPipeManuTech.find(params[:id])
  end

  # POST /tobacco_pipe_manu_teches
  # POST /tobacco_pipe_manu_teches.json
  def create
    @tobacco_pipe_manu_tech = TobaccoPipeManuTech.new(params[:tobacco_pipe_manu_tech])

    respond_to do |format|
      if @tobacco_pipe_manu_tech.save
        format.html { redirect_to @tobacco_pipe_manu_tech, notice: 'Tobacco pipe manu tech was successfully created.' }
        format.json { render json: @tobacco_pipe_manu_tech, status: :created, location: @tobacco_pipe_manu_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_manu_teches/1
  # PUT /tobacco_pipe_manu_teches/1.json
  def update
    @tobacco_pipe_manu_tech = TobaccoPipeManuTech.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_manu_tech.update_attributes(params[:tobacco_pipe_manu_tech])
        format.html { redirect_to @tobacco_pipe_manu_tech, notice: 'Tobacco pipe manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_manu_teches/1
  # DELETE /tobacco_pipe_manu_teches/1.json
  def destroy
    @tobacco_pipe_manu_tech = TobaccoPipeManuTech.find(params[:id])
    @tobacco_pipe_manu_tech.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_manu_teches_url }
      format.json { head :no_content }
    end
  end
end
