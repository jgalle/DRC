class TobaccoPipeMaterialsController < ApplicationController
  # GET /tobacco_pipe_materials
  # GET /tobacco_pipe_materials.json
  def index
    @tobacco_pipe_materials = TobaccoPipeMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_materials }
    end
  end

  # GET /tobacco_pipe_materials/1
  # GET /tobacco_pipe_materials/1.json
  def show
    @tobacco_pipe_material = TobaccoPipeMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_material }
    end
  end

  # GET /tobacco_pipe_materials/new
  # GET /tobacco_pipe_materials/new.json
  def new
    @tobacco_pipe_material = TobaccoPipeMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_material }
    end
  end

  # GET /tobacco_pipe_materials/1/edit
  def edit
    @tobacco_pipe_material = TobaccoPipeMaterial.find(params[:id])
  end

  # POST /tobacco_pipe_materials
  # POST /tobacco_pipe_materials.json
  def create
    @tobacco_pipe_material = TobaccoPipeMaterial.new(params[:tobacco_pipe_material])

    respond_to do |format|
      if @tobacco_pipe_material.save
        format.html { redirect_to @tobacco_pipe_material, notice: 'Tobacco pipe material was successfully created.' }
        format.json { render json: @tobacco_pipe_material, status: :created, location: @tobacco_pipe_material }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_materials/1
  # PUT /tobacco_pipe_materials/1.json
  def update
    @tobacco_pipe_material = TobaccoPipeMaterial.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_material.update_attributes(params[:tobacco_pipe_material])
        format.html { redirect_to @tobacco_pipe_material, notice: 'Tobacco pipe material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_materials/1
  # DELETE /tobacco_pipe_materials/1.json
  def destroy
    @tobacco_pipe_material = TobaccoPipeMaterial.find(params[:id])
    @tobacco_pipe_material.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_materials_url }
      format.json { head :no_content }
    end
  end
end
