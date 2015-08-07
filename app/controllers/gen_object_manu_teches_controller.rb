class GenObjectManuTechesController < ApplicationController
  # GET /gen_object_manu_teches
  # GET /gen_object_manu_teches.json
  def index
    @gen_object_manu_teches = GenObjectManuTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_manu_teches }
    end
  end

  # GET /gen_object_manu_teches/1
  # GET /gen_object_manu_teches/1.json
  def show
    @gen_object_manu_tech = GenObjectManuTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_manu_tech }
    end
  end

  # GET /gen_object_manu_teches/new
  # GET /gen_object_manu_teches/new.json
  def new
    @gen_object_manu_tech = GenObjectManuTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_manu_tech }
    end
  end

  # GET /gen_object_manu_teches/1/edit
  def edit
    @gen_object_manu_tech = GenObjectManuTech.find(params[:id])
  end

  # POST /gen_object_manu_teches
  # POST /gen_object_manu_teches.json
  def create
    @gen_object_manu_tech = GenObjectManuTech.new(params[:gen_object_manu_tech])

    respond_to do |format|
      if @gen_object_manu_tech.save
        format.html { redirect_to @gen_object_manu_tech, notice: 'Gen object manu tech was successfully created.' }
        format.json { render json: @gen_object_manu_tech, status: :created, location: @gen_object_manu_tech }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_manu_teches/1
  # PUT /gen_object_manu_teches/1.json
  def update
    @gen_object_manu_tech = GenObjectManuTech.find(params[:id])

    respond_to do |format|
      if @gen_object_manu_tech.update_attributes(params[:gen_object_manu_tech])
        format.html { redirect_to @gen_object_manu_tech, notice: 'Gen object manu tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_manu_tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_manu_teches/1
  # DELETE /gen_object_manu_teches/1.json
  def destroy
    @gen_object_manu_tech = GenObjectManuTech.find(params[:id])
    @gen_object_manu_tech.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_manu_teches_url }
      format.json { head :no_content }
    end
  end
end
