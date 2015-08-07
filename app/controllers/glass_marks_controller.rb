class GlassMarksController < ApplicationController
  # GET /glass_marks
  # GET /glass_marks.json
  def index
    @glass_marks = GlassMark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_marks }
    end
  end

  # GET /glass_marks/1
  # GET /glass_marks/1.json
  def show
    @glass_mark = GlassMark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_mark }
    end
  end

  # GET /glass_marks/new
  # GET /glass_marks/new.json
  def new
    @glass_mark = GlassMark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_mark }
    end
  end

  # GET /glass_marks/1/edit
  def edit
    @glass_mark = GlassMark.find(params[:id])
  end

  # POST /glass_marks
  # POST /glass_marks.json
  def create
    @glass_mark = GlassMark.new(params[:glass_mark])

    respond_to do |format|
      if @glass_mark.save
        format.html { redirect_to @glass_mark, notice: 'Glass mark was successfully created.' }
        format.json { render json: @glass_mark, status: :created, location: @glass_mark }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_marks/1
  # PUT /glass_marks/1.json
  def update
    @glass_mark = GlassMark.find(params[:id])

    respond_to do |format|
      if @glass_mark.update_attributes(params[:glass_mark])
        format.html { redirect_to @glass_mark, notice: 'Glass mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_marks/1
  # DELETE /glass_marks/1.json
  def destroy
    @glass_mark = GlassMark.find(params[:id])
    @glass_mark.destroy

    respond_to do |format|
      format.html { redirect_to glass_marks_url }
      format.json { head :no_content }
    end
  end
end
