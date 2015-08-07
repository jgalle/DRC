class GlassColorsController < ApplicationController
  # GET /glass_colors
  # GET /glass_colors.json
  def index
    @glass_colors = GlassColor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_colors }
    end
  end

  # GET /glass_colors/1
  # GET /glass_colors/1.json
  def show
    @glass_color = GlassColor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_color }
    end
  end

  # GET /glass_colors/new
  # GET /glass_colors/new.json
  def new
    @glass_color = GlassColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_color }
    end
  end

  # GET /glass_colors/1/edit
  def edit
    @glass_color = GlassColor.find(params[:id])
  end

  # POST /glass_colors
  # POST /glass_colors.json
  def create
    @glass_color = GlassColor.new(params[:glass_color])

    respond_to do |format|
      if @glass_color.save
        format.html { redirect_to @glass_color, notice: 'Glass color was successfully created.' }
        format.json { render json: @glass_color, status: :created, location: @glass_color }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_colors/1
  # PUT /glass_colors/1.json
  def update
    @glass_color = GlassColor.find(params[:id])

    respond_to do |format|
      if @glass_color.update_attributes(params[:glass_color])
        format.html { redirect_to @glass_color, notice: 'Glass color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_colors/1
  # DELETE /glass_colors/1.json
  def destroy
    @glass_color = GlassColor.find(params[:id])
    @glass_color.destroy

    respond_to do |format|
      format.html { redirect_to glass_colors_url }
      format.json { head :no_content }
    end
  end
end
