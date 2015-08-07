class GlassBottleElementsController < ApplicationController
  # GET /glass_bottle_elements
  # GET /glass_bottle_elements.json
  def index
    @glass_bottle_elements = GlassBottleElement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_bottle_elements }
    end
  end

  # GET /glass_bottle_elements/1
  # GET /glass_bottle_elements/1.json
  def show
    @glass_bottle_element = GlassBottleElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_bottle_element }
    end
  end

  # GET /glass_bottle_elements/new
  # GET /glass_bottle_elements/new.json
  def new
    @glass_bottle_element = GlassBottleElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_bottle_element }
    end
  end

  # GET /glass_bottle_elements/1/edit
  def edit
    @glass_bottle_element = GlassBottleElement.find(params[:id])
  end

  # POST /glass_bottle_elements
  # POST /glass_bottle_elements.json
  def create
    @glass_bottle_element = GlassBottleElement.new(params[:glass_bottle_element])

    respond_to do |format|
      if @glass_bottle_element.save
        format.html { redirect_to @glass_bottle_element, notice: 'Glass bottle element was successfully created.' }
        format.json { render json: @glass_bottle_element, status: :created, location: @glass_bottle_element }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_bottle_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_bottle_elements/1
  # PUT /glass_bottle_elements/1.json
  def update
    @glass_bottle_element = GlassBottleElement.find(params[:id])

    respond_to do |format|
      if @glass_bottle_element.update_attributes(params[:glass_bottle_element])
        format.html { redirect_to @glass_bottle_element, notice: 'Glass bottle element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_bottle_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_bottle_elements/1
  # DELETE /glass_bottle_elements/1.json
  def destroy
    @glass_bottle_element = GlassBottleElement.find(params[:id])
    @glass_bottle_element.destroy

    respond_to do |format|
      format.html { redirect_to glass_bottle_elements_url }
      format.json { head :no_content }
    end
  end
end
