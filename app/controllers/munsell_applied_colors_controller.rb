class MunsellAppliedColorsController < ApplicationController
  # GET /munsell_applied_colors
  # GET /munsell_applied_colors.json
  def index
    @munsell_applied_colors = MunsellAppliedColor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @munsell_applied_colors }
    end
  end

  # GET /munsell_applied_colors/1
  # GET /munsell_applied_colors/1.json
  def show
    @munsell_applied_color = MunsellAppliedColor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @munsell_applied_color }
    end
  end

  # GET /munsell_applied_colors/new
  # GET /munsell_applied_colors/new.json
  def new
    @munsell_applied_color = MunsellAppliedColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @munsell_applied_color }
    end
  end

  # GET /munsell_applied_colors/1/edit
  def edit
    @munsell_applied_color = MunsellAppliedColor.find(params[:id])
  end

  # POST /munsell_applied_colors
  # POST /munsell_applied_colors.json
  def create
    @munsell_applied_color = MunsellAppliedColor.new(params[:munsell_applied_color])

    respond_to do |format|
      if @munsell_applied_color.save
        format.html { redirect_to @munsell_applied_color, notice: 'Munsell applied color was successfully created.' }
        format.json { render json: @munsell_applied_color, status: :created, location: @munsell_applied_color }
      else
        format.html { render action: "new" }
        format.json { render json: @munsell_applied_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /munsell_applied_colors/1
  # PUT /munsell_applied_colors/1.json
  def update
    @munsell_applied_color = MunsellAppliedColor.find(params[:id])

    respond_to do |format|
      if @munsell_applied_color.update_attributes(params[:munsell_applied_color])
        format.html { redirect_to @munsell_applied_color, notice: 'Munsell applied color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @munsell_applied_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /munsell_applied_colors/1
  # DELETE /munsell_applied_colors/1.json
  def destroy
    @munsell_applied_color = MunsellAppliedColor.find(params[:id])
    @munsell_applied_color.destroy

    respond_to do |format|
      format.html { redirect_to munsell_applied_colors_url }
      format.json { head :no_content }
    end
  end
end
