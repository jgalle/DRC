class GlassPontilMarksController < ApplicationController
  # GET /glass_pontil_marks
  # GET /glass_pontil_marks.json
  def index
    @glass_pontil_marks = GlassPontilMark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_pontil_marks }
    end
  end

  # GET /glass_pontil_marks/1
  # GET /glass_pontil_marks/1.json
  def show
    @glass_pontil_mark = GlassPontilMark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_pontil_mark }
    end
  end

  # GET /glass_pontil_marks/new
  # GET /glass_pontil_marks/new.json
  def new
    @glass_pontil_mark = GlassPontilMark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_pontil_mark }
    end
  end

  # GET /glass_pontil_marks/1/edit
  def edit
    @glass_pontil_mark = GlassPontilMark.find(params[:id])
  end

  # POST /glass_pontil_marks
  # POST /glass_pontil_marks.json
  def create
    @glass_pontil_mark = GlassPontilMark.new(params[:glass_pontil_mark])

    respond_to do |format|
      if @glass_pontil_mark.save
        format.html { redirect_to @glass_pontil_mark, notice: 'Glass pontil mark was successfully created.' }
        format.json { render json: @glass_pontil_mark, status: :created, location: @glass_pontil_mark }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_pontil_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_pontil_marks/1
  # PUT /glass_pontil_marks/1.json
  def update
    @glass_pontil_mark = GlassPontilMark.find(params[:id])

    respond_to do |format|
      if @glass_pontil_mark.update_attributes(params[:glass_pontil_mark])
        format.html { redirect_to @glass_pontil_mark, notice: 'Glass pontil mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_pontil_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_pontil_marks/1
  # DELETE /glass_pontil_marks/1.json
  def destroy
    @glass_pontil_mark = GlassPontilMark.find(params[:id])
    @glass_pontil_mark.destroy

    respond_to do |format|
      format.html { redirect_to glass_pontil_marks_url }
      format.json { head :no_content }
    end
  end
end
