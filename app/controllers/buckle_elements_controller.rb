class BuckleElementsController < ApplicationController
  # GET /buckle_elements
  # GET /buckle_elements.json
  def index
    @buckle_elements = BuckleElement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_elements }
    end
  end

  # GET /buckle_elements/1
  # GET /buckle_elements/1.json
  def show
    @buckle_element = BuckleElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_element }
    end
  end

  # GET /buckle_elements/new
  # GET /buckle_elements/new.json
  def new
    @buckle_element = BuckleElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_element }
    end
  end

  # GET /buckle_elements/1/edit
  def edit
    @buckle_element = BuckleElement.find(params[:id])
  end

  # POST /buckle_elements
  # POST /buckle_elements.json
  def create
    @buckle_element = BuckleElement.new(params[:buckle_element])

    respond_to do |format|
      if @buckle_element.save
        format.html { redirect_to @buckle_element, notice: 'Buckle element was successfully created.' }
        format.json { render json: @buckle_element, status: :created, location: @buckle_element }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_elements/1
  # PUT /buckle_elements/1.json
  def update
    @buckle_element = BuckleElement.find(params[:id])

    respond_to do |format|
      if @buckle_element.update_attributes(params[:buckle_element])
        format.html { redirect_to @buckle_element, notice: 'Buckle element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_elements/1
  # DELETE /buckle_elements/1.json
  def destroy
    @buckle_element = BuckleElement.find(params[:id])
    @buckle_element.destroy

    respond_to do |format|
      format.html { redirect_to buckle_elements_url }
      format.json { head :no_content }
    end
  end
end
