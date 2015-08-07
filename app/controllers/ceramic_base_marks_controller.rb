class CeramicBaseMarksController < ApplicationController
  # GET /ceramic_base_marks
  # GET /ceramic_base_marks.json
  def index
    @ceramic_base_marks = CeramicBaseMark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_base_marks }
    end
  end

  # GET /ceramic_base_marks/1
  # GET /ceramic_base_marks/1.json
  def show
    @ceramic_base_mark = CeramicBaseMark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_base_mark }
    end
  end

  # GET /ceramic_base_marks/new
  # GET /ceramic_base_marks/new.json
  def new
    @ceramic_base_mark = CeramicBaseMark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_base_mark }
    end
  end

  # GET /ceramic_base_marks/1/edit
  def edit
    @ceramic_base_mark = CeramicBaseMark.find(params[:id])
  end

  # POST /ceramic_base_marks
  # POST /ceramic_base_marks.json
  def create
    @ceramic_base_mark = CeramicBaseMark.new(params[:ceramic_base_mark])

    respond_to do |format|
      if @ceramic_base_mark.save
        format.html { redirect_to @ceramic_base_mark, notice: 'Ceramic base mark was successfully created.' }
        format.json { render json: @ceramic_base_mark, status: :created, location: @ceramic_base_mark }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_base_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_base_marks/1
  # PUT /ceramic_base_marks/1.json
  def update
    @ceramic_base_mark = CeramicBaseMark.find(params[:id])

    respond_to do |format|
      if @ceramic_base_mark.update_attributes(params[:ceramic_base_mark])
        format.html { redirect_to @ceramic_base_mark, notice: 'Ceramic base mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_base_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_base_marks/1
  # DELETE /ceramic_base_marks/1.json
  def destroy
    @ceramic_base_mark = CeramicBaseMark.find(params[:id])
    @ceramic_base_mark.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_base_marks_url }
      format.json { head :no_content }
    end
  end
end
