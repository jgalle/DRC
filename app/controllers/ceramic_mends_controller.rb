class CeramicMendsController < ApplicationController
  # GET /ceramic_mends
  # GET /ceramic_mends.json
  def index
    @ceramic_mends = CeramicMend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_mends }
    end
  end

  # GET /ceramic_mends/1
  # GET /ceramic_mends/1.json
  def show
    @ceramic_mend = CeramicMend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_mend }
    end
  end

  # GET /ceramic_mends/new
  # GET /ceramic_mends/new.json
  def new
    @ceramic_mend = CeramicMend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_mend }
    end
  end

  # GET /ceramic_mends/1/edit
  def edit
    @ceramic_mend = CeramicMend.find(params[:id])
  end

  # POST /ceramic_mends
  # POST /ceramic_mends.json
  def create
    @ceramic_mend = CeramicMend.new(params[:ceramic_mend])

    respond_to do |format|
      if @ceramic_mend.save
        format.html { redirect_to @ceramic_mend, notice: 'Ceramic mend was successfully created.' }
        format.json { render json: @ceramic_mend, status: :created, location: @ceramic_mend }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_mend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_mends/1
  # PUT /ceramic_mends/1.json
  def update
    @ceramic_mend = CeramicMend.find(params[:id])

    respond_to do |format|
      if @ceramic_mend.update_attributes(params[:ceramic_mend])
        format.html { redirect_to @ceramic_mend, notice: 'Ceramic mend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_mend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_mends/1
  # DELETE /ceramic_mends/1.json
  def destroy
    @ceramic_mend = CeramicMend.find(params[:id])
    @ceramic_mend.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_mends_url }
      format.json { head :no_content }
    end
  end
end
