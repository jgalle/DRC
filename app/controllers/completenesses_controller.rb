class CompletenessesController < ApplicationController
  # GET /completenesses
  # GET /completenesses.json
  def index
    @completenesses = Completeness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @completenesses }
    end
  end

  # GET /completenesses/1
  # GET /completenesses/1.json
  def show
    @completeness = Completeness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @completeness }
    end
  end

  # GET /completenesses/new
  # GET /completenesses/new.json
  def new
    @completeness = Completeness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @completeness }
    end
  end

  # GET /completenesses/1/edit
  def edit
    @completeness = Completeness.find(params[:id])
  end

  # POST /completenesses
  # POST /completenesses.json
  def create
    @completeness = Completeness.new(params[:completeness])

    respond_to do |format|
      if @completeness.save
        format.html { redirect_to @completeness, notice: 'Completeness was successfully created.' }
        format.json { render json: @completeness, status: :created, location: @completeness }
      else
        format.html { render action: "new" }
        format.json { render json: @completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /completenesses/1
  # PUT /completenesses/1.json
  def update
    @completeness = Completeness.find(params[:id])

    respond_to do |format|
      if @completeness.update_attributes(params[:completeness])
        format.html { redirect_to @completeness, notice: 'Completeness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /completenesses/1
  # DELETE /completenesses/1.json
  def destroy
    @completeness = Completeness.find(params[:id])
    @completeness.destroy

    respond_to do |format|
      format.html { redirect_to completenesses_url }
      format.json { head :no_content }
    end
  end
end
