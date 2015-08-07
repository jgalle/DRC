class BuckleTypesController < ApplicationController
  # GET /buckle_types
  # GET /buckle_types.json
  def index
    @buckle_types = BuckleType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_types }
    end
  end

  # GET /buckle_types/1
  # GET /buckle_types/1.json
  def show
    @buckle_type = BuckleType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_type }
    end
  end

  # GET /buckle_types/new
  # GET /buckle_types/new.json
  def new
    @buckle_type = BuckleType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_type }
    end
  end

  # GET /buckle_types/1/edit
  def edit
    @buckle_type = BuckleType.find(params[:id])
  end

  # POST /buckle_types
  # POST /buckle_types.json
  def create
    @buckle_type = BuckleType.new(params[:buckle_type])

    respond_to do |format|
      if @buckle_type.save
        format.html { redirect_to @buckle_type, notice: 'Buckle type was successfully created.' }
        format.json { render json: @buckle_type, status: :created, location: @buckle_type }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_types/1
  # PUT /buckle_types/1.json
  def update
    @buckle_type = BuckleType.find(params[:id])

    respond_to do |format|
      if @buckle_type.update_attributes(params[:buckle_type])
        format.html { redirect_to @buckle_type, notice: 'Buckle type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_types/1
  # DELETE /buckle_types/1.json
  def destroy
    @buckle_type = BuckleType.find(params[:id])
    @buckle_type.destroy

    respond_to do |format|
      format.html { redirect_to buckle_types_url }
      format.json { head :no_content }
    end
  end
end
