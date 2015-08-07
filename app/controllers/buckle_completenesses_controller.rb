class BuckleCompletenessesController < ApplicationController
  # GET /buckle_completenesses
  # GET /buckle_completenesses.json
  def index
    @buckle_completenesses = BuckleCompleteness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckle_completenesses }
    end
  end

  # GET /buckle_completenesses/1
  # GET /buckle_completenesses/1.json
  def show
    @buckle_completeness = BuckleCompleteness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle_completeness }
    end
  end

  # GET /buckle_completenesses/new
  # GET /buckle_completenesses/new.json
  def new
    @buckle_completeness = BuckleCompleteness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buckle_completeness }
    end
  end

  # GET /buckle_completenesses/1/edit
  def edit
    @buckle_completeness = BuckleCompleteness.find(params[:id])
  end

  # POST /buckle_completenesses
  # POST /buckle_completenesses.json
  def create
    @buckle_completeness = BuckleCompleteness.new(params[:buckle_completeness])

    respond_to do |format|
      if @buckle_completeness.save
        format.html { redirect_to @buckle_completeness, notice: 'Buckle completeness was successfully created.' }
        format.json { render json: @buckle_completeness, status: :created, location: @buckle_completeness }
      else
        format.html { render action: "new" }
        format.json { render json: @buckle_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buckle_completenesses/1
  # PUT /buckle_completenesses/1.json
  def update
    @buckle_completeness = BuckleCompleteness.find(params[:id])

    respond_to do |format|
      if @buckle_completeness.update_attributes(params[:buckle_completeness])
        format.html { redirect_to @buckle_completeness, notice: 'Buckle completeness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckle_completenesses/1
  # DELETE /buckle_completenesses/1.json
  def destroy
    @buckle_completeness = BuckleCompleteness.find(params[:id])
    @buckle_completeness.destroy

    respond_to do |format|
      format.html { redirect_to buckle_completenesses_url }
      format.json { head :no_content }
    end
  end
end
