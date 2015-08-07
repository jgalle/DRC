class CeramicDecTechStyElementsController < ApplicationController
  # GET /ceramic_dec_tech_sty_elements
  # GET /ceramic_dec_tech_sty_elements.json
  def index
    @ceramic_dec_tech_sty_elements = CeramicDecTechStyElement.all.order('"DecTechStyElem"')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_dec_tech_sty_elements }
    end
  end

  # GET /ceramic_dec_tech_sty_elements/1
  # GET /ceramic_dec_tech_sty_elements/1.json
  def show
    @ceramic_dec_tech_sty_element = CeramicDecTechStyElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_dec_tech_sty_element }
    end
  end

  # GET /ceramic_dec_tech_sty_elements/new
  # GET /ceramic_dec_tech_sty_elements/new.json
  def new
    @ceramic_dec_tech_sty_element = CeramicDecTechStyElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_dec_tech_sty_element }
    end
  end

  # GET /ceramic_dec_tech_sty_elements/1/edit
  def edit
    @ceramic_dec_tech_sty_element = CeramicDecTechStyElement.find(params[:id])
  end

  # POST /ceramic_dec_tech_sty_elements
  # POST /ceramic_dec_tech_sty_elements.json
  def create
    @ceramic_dec_tech_sty_element = CeramicDecTechStyElement.new(params[:ceramic_dec_tech_sty_element])

    respond_to do |format|
      if @ceramic_dec_tech_sty_element.save
        format.html { redirect_to @ceramic_dec_tech_sty_element, notice: 'Ceramic dec tech sty element was successfully created.' }
        format.json { render json: @ceramic_dec_tech_sty_element, status: :created, location: @ceramic_dec_tech_sty_element }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_dec_tech_sty_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_dec_tech_sty_elements/1
  # PUT /ceramic_dec_tech_sty_elements/1.json
  def update
    @ceramic_dec_tech_sty_element = CeramicDecTechStyElement.find(params[:id])

    respond_to do |format|
      if @ceramic_dec_tech_sty_element.update_attributes(params[:ceramic_dec_tech_sty_element])
        format.html { redirect_to @ceramic_dec_tech_sty_element, notice: 'Ceramic dec tech sty element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_dec_tech_sty_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_dec_tech_sty_elements/1
  # DELETE /ceramic_dec_tech_sty_elements/1.json
  def destroy
    @ceramic_dec_tech_sty_element = CeramicDecTechStyElement.find(params[:id])
    @ceramic_dec_tech_sty_element.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_dec_tech_sty_elements_url }
      format.json { head :no_content }
    end
  end
end
