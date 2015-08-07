class ButtonMetalColorsController < ApplicationController
  # GET /button_metal_colors
  # GET /button_metal_colors.json
  def index
    @button_metal_colors = ButtonMetalColor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_metal_colors }
    end
  end

  # GET /button_metal_colors/1
  # GET /button_metal_colors/1.json
  def show
    @button_metal_color = ButtonMetalColor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_metal_color }
    end
  end

  # GET /button_metal_colors/new
  # GET /button_metal_colors/new.json
  def new
    @button_metal_color = ButtonMetalColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_metal_color }
    end
  end

  # GET /button_metal_colors/1/edit
  def edit
    @button_metal_color = ButtonMetalColor.find(params[:id])
  end

  # POST /button_metal_colors
  # POST /button_metal_colors.json
  def create
    @button_metal_color = ButtonMetalColor.new(params[:button_metal_color])

    respond_to do |format|
      if @button_metal_color.save
        format.html { redirect_to @button_metal_color, notice: 'Button metal color was successfully created.' }
        format.json { render json: @button_metal_color, status: :created, location: @button_metal_color }
      else
        format.html { render action: "new" }
        format.json { render json: @button_metal_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_metal_colors/1
  # PUT /button_metal_colors/1.json
  def update
    @button_metal_color = ButtonMetalColor.find(params[:id])

    respond_to do |format|
      if @button_metal_color.update_attributes(params[:button_metal_color])
        format.html { redirect_to @button_metal_color, notice: 'Button metal color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_metal_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_metal_colors/1
  # DELETE /button_metal_colors/1.json
  def destroy
    @button_metal_color = ButtonMetalColor.find(params[:id])
    @button_metal_color.destroy

    respond_to do |format|
      format.html { redirect_to button_metal_colors_url }
      format.json { head :no_content }
    end
  end
end
