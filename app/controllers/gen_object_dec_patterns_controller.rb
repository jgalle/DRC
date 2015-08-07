class GenObjectDecPatternsController < ApplicationController
  # GET /gen_object_dec_patterns
  # GET /gen_object_dec_patterns.json
  def index
    @gen_object_dec_patterns = GenObjectDecPattern.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_object_dec_patterns }
    end
  end

  # GET /gen_object_dec_patterns/1
  # GET /gen_object_dec_patterns/1.json
  def show
    @gen_object_dec_pattern = GenObjectDecPattern.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object_dec_pattern }
    end
  end

  # GET /gen_object_dec_patterns/new
  # GET /gen_object_dec_patterns/new.json
  def new
    @gen_object_dec_pattern = GenObjectDecPattern.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gen_object_dec_pattern }
    end
  end

  # GET /gen_object_dec_patterns/1/edit
  def edit
    @gen_object_dec_pattern = GenObjectDecPattern.find(params[:id])
  end

  # POST /gen_object_dec_patterns
  # POST /gen_object_dec_patterns.json
  def create
    @gen_object_dec_pattern = GenObjectDecPattern.new(params[:gen_object_dec_pattern])

    respond_to do |format|
      if @gen_object_dec_pattern.save
        format.html { redirect_to @gen_object_dec_pattern, notice: 'Gen object dec pattern was successfully created.' }
        format.json { render json: @gen_object_dec_pattern, status: :created, location: @gen_object_dec_pattern }
      else
        format.html { render action: "new" }
        format.json { render json: @gen_object_dec_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_object_dec_patterns/1
  # PUT /gen_object_dec_patterns/1.json
  def update
    @gen_object_dec_pattern = GenObjectDecPattern.find(params[:id])

    respond_to do |format|
      if @gen_object_dec_pattern.update_attributes(params[:gen_object_dec_pattern])
        format.html { redirect_to @gen_object_dec_pattern, notice: 'Gen object dec pattern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object_dec_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_object_dec_patterns/1
  # DELETE /gen_object_dec_patterns/1.json
  def destroy
    @gen_object_dec_pattern = GenObjectDecPattern.find(params[:id])
    @gen_object_dec_pattern.destroy

    respond_to do |format|
      format.html { redirect_to gen_object_dec_patterns_url }
      format.json { head :no_content }
    end
  end
end
