class BucklePartsController < ApplicationController
  # GET /buckle_parts
  # GET /buckle_parts.json
  def index
    @buckle_parts = BucklePart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_parts }
    end
  end

  # GET /buckle_parts/1
  # GET /buckle_parts/1.json
  def show
    @buckle_part = BucklePart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_part }
    end
  end

  # GET /buckle_parts/new
  # GET /buckle_parts/new.json
  def new
    @buckle_part = BucklePart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_part }
    end
  end

  # GET /buckle_parts/1/edit
  def edit
    @buckle_part = BucklePart.find(params[:id])
  end

  # POST /buckle_parts
  # POST /buckle_parts.json
  def create
    @buckle_part = BucklePart.new(params[:buckle_part])

    respond_to do |format|
      if @buckle_part.save
        format.html { redirect_to @buckle_part, notice: 'Buckle part was successfully created.' }
        format.json { render json: @buckle_part, status: :created, location: @buckle_part }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_parts/1
  # PUT /buckle_parts/1.json
  def update
    @buckle_part = BucklePart.find(params[:id])

    respond_to do |format|
      if @buckle_part.update_attributes(params[:buckle_part])
        format.html { redirect_to @buckle_part, notice: 'Buckle part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_parts/1
  # DELETE /buckle_parts/1.json
  def destroy
    @buckle_part = BucklePart.find(params[:id])
    @buckle_part.destroy

    respond_to do |format|
      format.html { redirect_to buckle_parts_url }
      format.json { head :no_content }
    end
  end
end
