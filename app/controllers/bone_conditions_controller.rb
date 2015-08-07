class BoneConditionsController < ApplicationController
  # GET /bone_conditions
  # GET /bone_conditions.json
  def index
    @bone_conditions = BoneCondition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_conditions }
    end
  end

  # GET /bone_conditions/1
  # GET /bone_conditions/1.json
  def show
    @bone_condition = BoneCondition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_condition }
    end
  end

  # GET /bone_conditions/new
  # GET /bone_conditions/new.json
  def new
    @bone_condition = BoneCondition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_condition }
    end
  end

  # GET /bone_conditions/1/edit
  def edit
    @bone_condition = BoneCondition.find(params[:id])
  end

  # POST /bone_conditions
  # POST /bone_conditions.json
  def create
    @bone_condition = BoneCondition.new(params[:bone_condition])

    respond_to do |format|
      if @bone_condition.save
        format.html { redirect_to @bone_condition, notice: 'Bone condition was successfully created.' }
        format.json { render json: @bone_condition, status: :created, location: @bone_condition }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_conditions/1
  # PUT /bone_conditions/1.json
  def update
    @bone_condition = BoneCondition.find(params[:id])

    respond_to do |format|
      if @bone_condition.update_attributes(params[:bone_condition])
        format.html { redirect_to @bone_condition, notice: 'Bone condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_conditions/1
  # DELETE /bone_conditions/1.json
  def destroy
    @bone_condition = BoneCondition.find(params[:id])
    @bone_condition.destroy

    respond_to do |format|
      format.html { redirect_to bone_conditions_url }
      format.json { head :no_content }
    end
  end
end
