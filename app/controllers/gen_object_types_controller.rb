class GenObjectTypesController < ApplicationController
  # GET /gen_object_types
  # GET /gen_object_types.json
  def index
    @gen_object_types = GenObjectType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_types }
    end
  end

  # GET /gen_object_types/1
  # GET /gen_object_types/1.json
  def show
    @gen_object_type = GenObjectType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_type }
    end
  end

  # GET /gen_object_types/new
  # GET /gen_object_types/new.json
  def new
    @gen_object_type = GenObjectType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_type }
    end
  end

  # GET /gen_object_types/1/edit
  def edit
    @gen_object_type = GenObjectType.find(params[:id])
  end

  # POST /gen_object_types
  # POST /gen_object_types.json
  def create
    @gen_object_type = GenObjectType.new(params[:gen_object_type])

    respond_to do |format|
      if @gen_object_type.save
        format.html { redirect_to @gen_object_type, notice: 'Gen object type was successfully created.' }
        format.json { render json: @gen_object_type, status: :created, location: @gen_object_type }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_types/1
  # PUT /gen_object_types/1.json
  def update
    @gen_object_type = GenObjectType.find(params[:id])

    respond_to do |format|
      if @gen_object_type.update_attributes(params[:gen_object_type])
        format.html { redirect_to @gen_object_type, notice: 'Gen object type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_types/1
  # DELETE /gen_object_types/1.json
  def destroy
    @gen_object_type = GenObjectType.find(params[:id])
    @gen_object_type.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_types_url }
      format.json { head :no_content }
    end
  end
end
