class BoneSummariesController < ApplicationController
  # GET /bone_summaries
  # GET /bone_summaries.json
  def index
    @bone_summaries = BoneSummary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_summaries }
    end
  end

  # GET /bone_summaries/1
  # GET /bone_summaries/1.json
  def show
    @bone_summary = BoneSummary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_summary }
    end
  end

  # GET /bone_summaries/new
  # GET /bone_summaries/new.json
  def new
    @bone_summary = BoneSummary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_summary }
    end
  end

  # GET /bone_summaries/1/edit
  def edit
    @bone_summary = BoneSummary.find(params[:id])
  end

  # POST /bone_summaries
  # POST /bone_summaries.json
  def create
    @bone_summary = BoneSummary.new(params[:bone_summary])

    respond_to do |format|
      if @bone_summary.save
        format.html { redirect_to @bone_summary, notice: 'Bone summary was successfully created.' }
        format.json { render json: @bone_summary, status: :created, location: @bone_summary }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_summaries/1
  # PUT /bone_summaries/1.json
  def update
    @bone_summary = BoneSummary.find(params[:id])

    respond_to do |format|
      if @bone_summary.update_attributes(params[:bone_summary])
        format.html { redirect_to @bone_summary, notice: 'Bone summary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_summaries/1
  # DELETE /bone_summaries/1.json
  def destroy
    @bone_summary = BoneSummary.find(params[:id])
    @bone_summary.destroy

    respond_to do |format|
      format.html { redirect_to bone_summaries_url }
      format.json { head :no_content }
    end
  end
end
