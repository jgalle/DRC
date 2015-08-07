class TobaccoPipeDecorationsController < ApplicationController
  # GET /tobacco_pipe_decorations
  # GET /tobacco_pipe_decorations.json
  def index
    @tobacco_pipe_decorations = TobaccoPipeDecoration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_decorations }
    end
  end

  # GET /tobacco_pipe_decorations/1
  # GET /tobacco_pipe_decorations/1.json
  def show
    @tobacco_pipe_decoration = TobaccoPipeDecoration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_decoration }
    end
  end

  # GET /tobacco_pipe_decorations/new
  # GET /tobacco_pipe_decorations/new.json
  def new
    @tobacco_pipe_decoration = TobaccoPipeDecoration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_decoration }
    end
  end

  # GET /tobacco_pipe_decorations/1/edit
  def edit
    @tobacco_pipe_decoration = TobaccoPipeDecoration.find(params[:id])
  end

  # POST /tobacco_pipe_decorations
  # POST /tobacco_pipe_decorations.json
  def create
    @tobacco_pipe_decoration = TobaccoPipeDecoration.new(params[:tobacco_pipe_decoration])

    respond_to do |format|
      if @tobacco_pipe_decoration.save
        format.html { redirect_to @tobacco_pipe_decoration, notice: 'Tobacco pipe decoration was successfully created.' }
        format.json { render json: @tobacco_pipe_decoration, status: :created, location: @tobacco_pipe_decoration }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_decoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_decorations/1
  # PUT /tobacco_pipe_decorations/1.json
  def update
    @tobacco_pipe_decoration = TobaccoPipeDecoration.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_decoration.update_attributes(params[:tobacco_pipe_decoration])
        format.html { redirect_to @tobacco_pipe_decoration, notice: 'Tobacco pipe decoration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_decoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_decorations/1
  # DELETE /tobacco_pipe_decorations/1.json
  def destroy
    @tobacco_pipe_decoration = TobaccoPipeDecoration.find(params[:id])
    @tobacco_pipe_decoration.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_decorations_url }
      format.json { head :no_content }
    end
  end
end
