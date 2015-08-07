class TobaccoPipeTextMarkTypesController < ApplicationController
  # GET /tobacco_pipe_text_mark_types
  # GET /tobacco_pipe_text_mark_types.json
  def index
    @tobacco_pipe_text_mark_types = TobaccoPipeTextMarkType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_text_mark_types }
    end
  end

  # GET /tobacco_pipe_text_mark_types/1
  # GET /tobacco_pipe_text_mark_types/1.json
  def show
    @tobacco_pipe_text_mark_type = TobaccoPipeTextMarkType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_text_mark_type }
    end
  end

  # GET /tobacco_pipe_text_mark_types/new
  # GET /tobacco_pipe_text_mark_types/new.json
  def new
    @tobacco_pipe_text_mark_type = TobaccoPipeTextMarkType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_text_mark_type }
    end
  end

  # GET /tobacco_pipe_text_mark_types/1/edit
  def edit
    @tobacco_pipe_text_mark_type = TobaccoPipeTextMarkType.find(params[:id])
  end

  # POST /tobacco_pipe_text_mark_types
  # POST /tobacco_pipe_text_mark_types.json
  def create
    @tobacco_pipe_text_mark_type = TobaccoPipeTextMarkType.new(params[:tobacco_pipe_text_mark_type])

    respond_to do |format|
      if @tobacco_pipe_text_mark_type.save
        format.html { redirect_to @tobacco_pipe_text_mark_type, notice: 'Tobacco pipe text mark type was successfully created.' }
        format.json { render json: @tobacco_pipe_text_mark_type, status: :created, location: @tobacco_pipe_text_mark_type }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_text_mark_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_text_mark_types/1
  # PUT /tobacco_pipe_text_mark_types/1.json
  def update
    @tobacco_pipe_text_mark_type = TobaccoPipeTextMarkType.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_text_mark_type.update_attributes(params[:tobacco_pipe_text_mark_type])
        format.html { redirect_to @tobacco_pipe_text_mark_type, notice: 'Tobacco pipe text mark type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_text_mark_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_text_mark_types/1
  # DELETE /tobacco_pipe_text_mark_types/1.json
  def destroy
    @tobacco_pipe_text_mark_type = TobaccoPipeTextMarkType.find(params[:id])
    @tobacco_pipe_text_mark_type.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_text_mark_types_url }
      format.json { head :no_content }
    end
  end
end
