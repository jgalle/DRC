class ContextPercentagesController < ApplicationController
  # GET /context_percentages
  # GET /context_percentages.json
  def index
    @context_percentages = ContextPercentage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_percentages }
    end
  end

  # GET /context_percentages/1
  # GET /context_percentages/1.json
  def show
    @context_percentage = ContextPercentage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_percentage }
    end
  end

  # GET /context_percentages/new
  # GET /context_percentages/new.json
  def new
    @context_percentage = ContextPercentage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_percentage }
    end
  end

  # GET /context_percentages/1/edit
  def edit
    @context_percentage = ContextPercentage.find(params[:id])
  end

  # POST /context_percentages
  # POST /context_percentages.json
  def create
    @context_percentage = ContextPercentage.new(params[:context_percentage])

    respond_to do |format|
      if @context_percentage.save
        format.html { redirect_to @context_percentage, notice: 'Context percentage was successfully created.' }
        format.json { render json: @context_percentage, status: :created, location: @context_percentage }
      else
        format.html { render action: "new" }
        format.json { render json: @context_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_percentages/1
  # PUT /context_percentages/1.json
  def update
    @context_percentage = ContextPercentage.find(params[:id])

    respond_to do |format|
      if @context_percentage.update_attributes(params[:context_percentage])
        format.html { redirect_to @context_percentage, notice: 'Context percentage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_percentages/1
  # DELETE /context_percentages/1.json
  def destroy
    @context_percentage = ContextPercentage.find(params[:id])
    @context_percentage.destroy

    respond_to do |format|
      format.html { redirect_to context_percentages_url }
      format.json { head :no_content }
    end
  end
end
