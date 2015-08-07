class SedimentColorsController < ApplicationController
  # GET /sediment_colors
  # GET /sediment_colors.json
  def index
    @sediment_colors = SedimentColor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sediment_colors }
    end
  end

  # GET /sediment_colors/1
  # GET /sediment_colors/1.json
  def show
    @sediment_color = SedimentColor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sediment_color }
    end
  end

  # GET /sediment_colors/new
  # GET /sediment_colors/new.json
  def new
    @sediment_color = SedimentColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sediment_color }
    end
  end

  # GET /sediment_colors/1/edit
  def edit
    @sediment_color = SedimentColor.find(params[:id])
  end

  # POST /sediment_colors
  # POST /sediment_colors.json
  def create
    @sediment_color = SedimentColor.new(params[:sediment_color])

    respond_to do |format|
      if @sediment_color.save
        format.html { redirect_to @sediment_color, notice: 'Sediment color was successfully created.' }
        format.json { render json: @sediment_color, status: :created, location: @sediment_color }
      else
        format.html { render action: "new" }
        format.json { render json: @sediment_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sediment_colors/1
  # PUT /sediment_colors/1.json
  def update
    @sediment_color = SedimentColor.find(params[:id])

    respond_to do |format|
      if @sediment_color.update_attributes(params[:sediment_color])
        format.html { redirect_to @sediment_color, notice: 'Sediment color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sediment_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sediment_colors/1
  # DELETE /sediment_colors/1.json
  def destroy
    @sediment_color = SedimentColor.find(params[:id])
    @sediment_color.destroy

    respond_to do |format|
      format.html { redirect_to sediment_colors_url }
      format.json { head :no_content }
    end
  end
end
