class CeramicCompletenessesController < ApplicationController
  # GET /ceramic_completenesses
  # GET /ceramic_completenesses.json
  def index
    @ceramic_completenesses = CeramicCompleteness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_completenesses }
    end
  end

  # GET /ceramic_completenesses/1
  # GET /ceramic_completenesses/1.json
  def show
    @ceramic_completeness = CeramicCompleteness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_completeness }
    end
  end

  # GET /ceramic_completenesses/new
  # GET /ceramic_completenesses/new.json
  def new
    @ceramic_completeness = CeramicCompleteness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_completeness }
    end
  end

  # GET /ceramic_completenesses/1/edit
  def edit
    @ceramic_completeness = CeramicCompleteness.find(params[:id])
  end

  # POST /ceramic_completenesses
  # POST /ceramic_completenesses.json
  def create
    @ceramic_completeness = CeramicCompleteness.new(params[:ceramic_completeness])

    respond_to do |format|
      if @ceramic_completeness.save
        format.html { redirect_to @ceramic_completeness, notice: 'Ceramic completeness was successfully created.' }
        format.json { render json: @ceramic_completeness, status: :created, location: @ceramic_completeness }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_completenesses/1
  # PUT /ceramic_completenesses/1.json
  def update
    @ceramic_completeness = CeramicCompleteness.find(params[:id])

    respond_to do |format|
      if @ceramic_completeness.update_attributes(params[:ceramic_completeness])
        format.html { redirect_to @ceramic_completeness, notice: 'Ceramic completeness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_completenesses/1
  # DELETE /ceramic_completenesses/1.json
  def destroy
    @ceramic_completeness = CeramicCompleteness.find(params[:id])
    @ceramic_completeness.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_completenesses_url }
      format.json { head :no_content }
    end
  end
end
