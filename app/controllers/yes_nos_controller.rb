class YesNosController < ApplicationController
  # GET /yes_nos
  # GET /yes_nos.json
  def index
    @yes_nos = YesNo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yes_nos }
    end
  end

  # GET /yes_nos/1
  # GET /yes_nos/1.json
  def show
    @yes_no = YesNo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yes_no }
    end
  end

  # GET /yes_nos/new
  # GET /yes_nos/new.json
  def new
    @yes_no = YesNo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yes_no }
    end
  end

  # GET /yes_nos/1/edit
  def edit
    @yes_no = YesNo.find(params[:id])
  end

  # POST /yes_nos
  # POST /yes_nos.json
  def create
    @yes_no = YesNo.new(params[:yes_no])

    respond_to do |format|
      if @yes_no.save
        format.html { redirect_to @yes_no, notice: 'Yes no was successfully created.' }
        format.json { render json: @yes_no, status: :created, location: @yes_no }
      else
        format.html { render action: "new" }
        format.json { render json: @yes_no.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yes_nos/1
  # PUT /yes_nos/1.json
  def update
    @yes_no = YesNo.find(params[:id])

    respond_to do |format|
      if @yes_no.update_attributes(params[:yes_no])
        format.html { redirect_to @yes_no, notice: 'Yes no was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yes_no.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yes_nos/1
  # DELETE /yes_nos/1.json
  def destroy
    @yes_no = YesNo.find(params[:id])
    @yes_no.destroy

    respond_to do |format|
      format.html { redirect_to yes_nos_url }
      format.json { head :no_content }
    end
  end
end
