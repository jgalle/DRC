class AcdistancesController < ApplicationController
  # GET /acdistances
  # GET /acdistances.json
  def index
    @acdistances = Acdistance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @acdistances }
    end
  end

  # GET /acdistances/1
  # GET /acdistances/1.json
  def show
    @acdistance = Acdistance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @acdistance }
    end
  end

  # GET /acdistances/new
  # GET /acdistances/new.json
  def new
    @acdistance = Acdistance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @acdistance }
    end
  end

  # GET /acdistances/1/edit
  def edit
    @acdistance = Acdistance.find(params[:id])
  end

  # POST /acdistances
  # POST /acdistances.json
  def create
    @acdistance = Acdistance.new(params[:acdistance])

    respond_to do |format|
      if @acdistance.save
        format.html { redirect_to @acdistance, notice: 'Acdistance was successfully created.' }
        format.json { render json: @acdistance, status: :created, location: @acdistance }
      else
        format.html { render action: "new" }
        format.json { render json: @acdistance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /acdistances/1
  # PUT /acdistances/1.json
  def update
    @acdistance = Acdistance.find(params[:id])

    respond_to do |format|
      if @acdistance.update_attributes(params[:acdistance])
        format.html { redirect_to @acdistance, notice: 'Acdistance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @acdistance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acdistances/1
  # DELETE /acdistances/1.json
  def destroy
    @acdistance = Acdistance.find(params[:id])
    @acdistance.destroy

    respond_to do |format|
      format.html { redirect_to acdistances_url }
      format.json { head :no_content }
    end
  end
end
