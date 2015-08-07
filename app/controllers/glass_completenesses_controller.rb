class GlassCompletenessesController < ApplicationController
  # GET /glass_completenesses
  # GET /glass_completenesses.json
  def index
    @glass_completenesses = GlassCompleteness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_completenesses }
    end
  end

  # GET /glass_completenesses/1
  # GET /glass_completenesses/1.json
  def show
    @glass_completeness = GlassCompleteness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_completeness }
    end
  end

  # GET /glass_completenesses/new
  # GET /glass_completenesses/new.json
  def new
    @glass_completeness = GlassCompleteness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_completeness }
    end
  end

  # GET /glass_completenesses/1/edit
  def edit
    @glass_completeness = GlassCompleteness.find(params[:id])
  end

  # POST /glass_completenesses
  # POST /glass_completenesses.json
  def create
    @glass_completeness = GlassCompleteness.new(params[:glass_completeness])

    respond_to do |format|
      if @glass_completeness.save
        format.html { redirect_to @glass_completeness, notice: 'Glass completeness was successfully created.' }
        format.json { render json: @glass_completeness, status: :created, location: @glass_completeness }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_completenesses/1
  # PUT /glass_completenesses/1.json
  def update
    @glass_completeness = GlassCompleteness.find(params[:id])

    respond_to do |format|
      if @glass_completeness.update_attributes(params[:glass_completeness])
        format.html { redirect_to @glass_completeness, notice: 'Glass completeness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_completenesses/1
  # DELETE /glass_completenesses/1.json
  def destroy
    @glass_completeness = GlassCompleteness.find(params[:id])
    @glass_completeness.destroy

    respond_to do |format|
      format.html { redirect_to glass_completenesses_url }
      format.json { head :no_content }
    end
  end
end
