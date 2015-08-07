class TobaccoPipeTextMarksController < ApplicationController
  # GET /tobacco_pipe_text_marks
  # GET /tobacco_pipe_text_marks.json
  def index
    @tobacco_pipe_text_marks = TobaccoPipeTextMark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_text_marks }
    end
  end

  # GET /tobacco_pipe_text_marks/1
  # GET /tobacco_pipe_text_marks/1.json
  def show
    @tobacco_pipe_text_mark = TobaccoPipeTextMark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_text_mark }
    end
  end

  # GET /tobacco_pipe_text_marks/new
  # GET /tobacco_pipe_text_marks/new.json
  def new
    @tobacco_pipe_text_mark = TobaccoPipeTextMark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_text_mark }
    end
  end

  # GET /tobacco_pipe_text_marks/1/edit
  def edit
    @tobacco_pipe_text_mark = TobaccoPipeTextMark.find(params[:id])
  end

  # POST /tobacco_pipe_text_marks
  # POST /tobacco_pipe_text_marks.json
  def create
    @tobacco_pipe_text_mark = TobaccoPipeTextMark.new(params[:tobacco_pipe_text_mark])

    respond_to do |format|
      if @tobacco_pipe_text_mark.save
        format.html { redirect_to @tobacco_pipe_text_mark, notice: 'Tobacco pipe text mark was successfully created.' }
        format.json { render json: @tobacco_pipe_text_mark, status: :created, location: @tobacco_pipe_text_mark }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_text_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_text_marks/1
  # PUT /tobacco_pipe_text_marks/1.json
  def update
    @tobacco_pipe_text_mark = TobaccoPipeTextMark.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_text_mark.update_attributes(params[:tobacco_pipe_text_mark])
        format.html { redirect_to @tobacco_pipe_text_mark, notice: 'Tobacco pipe text mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_text_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_text_marks/1
  # DELETE /tobacco_pipe_text_marks/1.json
  def destroy
    @tobacco_pipe_text_mark = TobaccoPipeTextMark.find(params[:id])
    @tobacco_pipe_text_mark.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_text_marks_url }
      format.json { head :no_content }
    end
  end
end
