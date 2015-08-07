class GenObjectCompletenessesController < ApplicationController
  # GET /gen_object_completenesses
  # GET /gen_object_completenesses.json
  def index
    @gen_object_completenesses = GenObjectCompleteness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_completenesses }
    end
  end

  # GET /gen_object_completenesses/1
  # GET /gen_object_completenesses/1.json
  def show
    @gen_object_completeness = GenObjectCompleteness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_completeness }
    end
  end

  # GET /gen_object_completenesses/new
  # GET /gen_object_completenesses/new.json
  def new
    @gen_object_completeness = GenObjectCompleteness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_completeness }
    end
  end

  # GET /gen_object_completenesses/1/edit
  def edit
    @gen_object_completeness = GenObjectCompleteness.find(params[:id])
  end

  # POST /gen_object_completenesses
  # POST /gen_object_completenesses.json
  def create
    @gen_object_completeness = GenObjectCompleteness.new(params[:gen_object_completeness])

    respond_to do |format|
      if @gen_object_completeness.save
        format.html { redirect_to @gen_object_completeness, notice: 'Gen object completeness was successfully created.' }
        format.json { render json: @gen_object_completeness, status: :created, location: @gen_object_completeness }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_completenesses/1
  # PUT /gen_object_completenesses/1.json
  def update
    @gen_object_completeness = GenObjectCompleteness.find(params[:id])

    respond_to do |format|
      if @gen_object_completeness.update_attributes(params[:gen_object_completeness])
        format.html { redirect_to @gen_object_completeness, notice: 'Gen object completeness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_completeness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_completenesses/1
  # DELETE /gen_object_completenesses/1.json
  def destroy
    @gen_object_completeness = GenObjectCompleteness.find(params[:id])
    @gen_object_completeness.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_completenesses_url }
      format.json { head :no_content }
    end
  end
end
