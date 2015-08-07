class TobaccoPipeBowlCompletenessesController < ApplicationController
  # GET /tobacco_pipe_bowl_completenesses
  # GET /tobacco_pipe_bowl_completenesses.json
  def index
    @tobacco_pipe_bowl_completenesses = TobaccoPipeBowlCompleteness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipe_bowl_completenesses }
    end
  end

  # GET /tobacco_pipe_bowl_completenesses/1
  # GET /tobacco_pipe_bowl_completenesses/1.json
  def show
    @tobacco_pipe_bowl_completeness = TobaccoPipeBowlCompleteness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe_bowl_completeness }
    end
  end

  # GET /tobacco_pipe_bowl_completenesses/new
  # GET /tobacco_pipe_bowl_completenesses/new.json
  def new
    @tobacco_pipe_bowl_completeness = TobaccoPipeBowlCompleteness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tobacco_pipe_bowl_completeness }
    end
  end

  # GET /tobacco_pipe_bowl_completenesses/1/edit
  def edit
    @tobacco_pipe_bowl_completeness = TobaccoPipeBowlCompleteness.find(params[:id])
  end

  # POST /tobacco_pipe_bowl_completenesses
  # POST /tobacco_pipe_bowl_completenesses.json
  def create
    @tobacco_pipe_bowl_completeness = TobaccoPipeBowlCompleteness.new(params[:tobacco_pipe_bowl_completeness])

    respond_to do |format|
      if @tobacco_pipe_bowl_completeness.save
        format.html { redirect_to @tobacco_pipe_bowl_completeness, notice: 'Tobacco pipe bowl completeness was successfully created.' }
        format.json { render json: @tobacco_pipe_bowl_completeness, status: :created, location: @tobacco_pipe_bowl_completeness }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe_bowl_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipe_bowl_completenesses/1
  # PUT /tobacco_pipe_bowl_completenesses/1.json
  def update
    @tobacco_pipe_bowl_completeness = TobaccoPipeBowlCompleteness.find(params[:id])

    respond_to do |format|
      if @tobacco_pipe_bowl_completeness.update_attributes(params[:tobacco_pipe_bowl_completeness])
        format.html { redirect_to @tobacco_pipe_bowl_completeness, notice: 'Tobacco pipe bowl completeness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe_bowl_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipe_bowl_completenesses/1
  # DELETE /tobacco_pipe_bowl_completenesses/1.json
  def destroy
    @tobacco_pipe_bowl_completeness = TobaccoPipeBowlCompleteness.find(params[:id])
    @tobacco_pipe_bowl_completeness.destroy

    respond_to do |format|
      format.html { redirect_to tobacco_pipe_bowl_completenesses_url }
      format.json { head :no_content }
    end
  end
end
