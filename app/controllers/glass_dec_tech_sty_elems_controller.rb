class GlassDecTechStyElemsController < ApplicationController
  # GET /glass_dec_tech_sty_elems
  # GET /glass_dec_tech_sty_elems.json
  def index
    @glass_dec_tech_sty_elems = GlassDecTechStyElem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_dec_tech_sty_elems }
    end
  end

  # GET /glass_dec_tech_sty_elems/1
  # GET /glass_dec_tech_sty_elems/1.json
  def show
    @glass_dec_tech_sty_elem = GlassDecTechStyElem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_dec_tech_sty_elem }
    end
  end

  # GET /glass_dec_tech_sty_elems/new
  # GET /glass_dec_tech_sty_elems/new.json
  def new
    @glass_dec_tech_sty_elem = GlassDecTechStyElem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_dec_tech_sty_elem }
    end
  end

  # GET /glass_dec_tech_sty_elems/1/edit
  def edit
    @glass_dec_tech_sty_elem = GlassDecTechStyElem.find(params[:id])
  end

  # POST /glass_dec_tech_sty_elems
  # POST /glass_dec_tech_sty_elems.json
  def create
    @glass_dec_tech_sty_elem = GlassDecTechStyElem.new(params[:glass_dec_tech_sty_elem])

    respond_to do |format|
      if @glass_dec_tech_sty_elem.save
        format.html { redirect_to @glass_dec_tech_sty_elem, notice: 'Glass dec tech sty elem was successfully created.' }
        format.json { render json: @glass_dec_tech_sty_elem, status: :created, location: @glass_dec_tech_sty_elem }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_dec_tech_sty_elem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_dec_tech_sty_elems/1
  # PUT /glass_dec_tech_sty_elems/1.json
  def update
    @glass_dec_tech_sty_elem = GlassDecTechStyElem.find(params[:id])

    respond_to do |format|
      if @glass_dec_tech_sty_elem.update_attributes(params[:glass_dec_tech_sty_elem])
        format.html { redirect_to @glass_dec_tech_sty_elem, notice: 'Glass dec tech sty elem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_dec_tech_sty_elem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_dec_tech_sty_elems/1
  # DELETE /glass_dec_tech_sty_elems/1.json
  def destroy
    @glass_dec_tech_sty_elem = GlassDecTechStyElem.find(params[:id])
    @glass_dec_tech_sty_elem.destroy

    respond_to do |format|
      format.html { redirect_to glass_dec_tech_sty_elems_url }
      format.json { head :no_content }
    end
  end
end
