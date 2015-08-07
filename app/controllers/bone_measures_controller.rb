class BoneMeasuresController < ApplicationController
  # GET /bone_measures
  # GET /bone_measures.json
  def index
    @bone_measures = BoneMeasure.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_measures }
    end
  end

  # GET /bone_measures/1
  # GET /bone_measures/1.json
  def show
    @bone_measure = BoneMeasure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_measure }
    end
  end

  # GET /bone_measures/new
  # GET /bone_measures/new.json
  def new
    @bone_measure = BoneMeasure.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_measure }
    end
  end

  # GET /bone_measures/1/edit
  def edit
    @bone_measure = BoneMeasure.find(params[:id])
  end

  # POST /bone_measures
  # POST /bone_measures.json
  def create
    @bone_measure = BoneMeasure.new(params[:bone_measure])

    respond_to do |format|
      if @bone_measure.save
        format.html { redirect_to @bone_measure, notice: 'Bone measure was successfully created.' }
        format.json { render json: @bone_measure, status: :created, location: @bone_measure }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_measures/1
  # PUT /bone_measures/1.json
  def update
    @bone_measure = BoneMeasure.find(params[:id])

    respond_to do |format|
      if @bone_measure.update_attributes(params[:bone_measure])
        format.html { redirect_to @bone_measure, notice: 'Bone measure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_measures/1
  # DELETE /bone_measures/1.json
  def destroy
    @bone_measure = BoneMeasure.find(params[:id])
    @bone_measure.destroy

    respond_to do |format|
      format.html { redirect_to bone_measures_url }
      format.json { head :no_content }
    end
  end
end
