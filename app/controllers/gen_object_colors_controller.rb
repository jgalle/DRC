class GenObjectColorsController < ApplicationController
  # GET /gen_object_colors
  # GET /gen_object_colors.json
  def index
    @gen_object_colors = GenObjectColor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_colors }
    end
  end

  # GET /gen_object_colors/1
  # GET /gen_object_colors/1.json
  def show
    @gen_object_color = GenObjectColor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_color }
    end
  end

  # GET /gen_object_colors/new
  # GET /gen_object_colors/new.json
  def new
    @gen_object_color = GenObjectColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_color }
    end
  end

  # GET /gen_object_colors/1/edit
  def edit
    @gen_object_color = GenObjectColor.find(params[:id])
  end

  # POST /gen_object_colors
  # POST /gen_object_colors.json
  def create
    @gen_object_color = GenObjectColor.new(params[:gen_object_color])

    respond_to do |format|
      if @gen_object_color.save
        format.html { redirect_to @gen_object_color, notice: 'Gen object color was successfully created.' }
        format.json { render json: @gen_object_color, status: :created, location: @gen_object_color }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_colors/1
  # PUT /gen_object_colors/1.json
  def update
    @gen_object_color = GenObjectColor.find(params[:id])

    respond_to do |format|
      if @gen_object_color.update_attributes(params[:gen_object_color])
        format.html { redirect_to @gen_object_color, notice: 'Gen object color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_colors/1
  # DELETE /gen_object_colors/1.json
  def destroy
    @gen_object_color = GenObjectColor.find(params[:id])
    @gen_object_color.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_colors_url }
      format.json { head :no_content }
    end
  end
end
