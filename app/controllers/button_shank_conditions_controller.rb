class ButtonShankConditionsController < ApplicationController
  # GET /button_shank_conditions
  # GET /button_shank_conditions.json
  def index
    @button_shank_conditions = ButtonShankCondition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_shank_conditions }
    end
  end

  # GET /button_shank_conditions/1
  # GET /button_shank_conditions/1.json
  def show
    @button_shank_condition = ButtonShankCondition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_shank_condition }
    end
  end

  # GET /button_shank_conditions/new
  # GET /button_shank_conditions/new.json
  def new
    @button_shank_condition = ButtonShankCondition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_shank_condition }
    end
  end

  # GET /button_shank_conditions/1/edit
  def edit
    @button_shank_condition = ButtonShankCondition.find(params[:id])
  end

  # POST /button_shank_conditions
  # POST /button_shank_conditions.json
  def create
    @button_shank_condition = ButtonShankCondition.new(params[:button_shank_condition])

    respond_to do |format|
      if @button_shank_condition.save
        format.html { redirect_to @button_shank_condition, notice: 'Button shank condition was successfully created.' }
        format.json { render json: @button_shank_condition, status: :created, location: @button_shank_condition }
      else
        format.html { render action: "new" }
        format.json { render json: @button_shank_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_shank_conditions/1
  # PUT /button_shank_conditions/1.json
  def update
    @button_shank_condition = ButtonShankCondition.find(params[:id])

    respond_to do |format|
      if @button_shank_condition.update_attributes(params[:button_shank_condition])
        format.html { redirect_to @button_shank_condition, notice: 'Button shank condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_shank_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_shank_conditions/1
  # DELETE /button_shank_conditions/1.json
  def destroy
    @button_shank_condition = ButtonShankCondition.find(params[:id])
    @button_shank_condition.destroy

    respond_to do |format|
      format.html { redirect_to button_shank_conditions_url }
      format.json { head :no_content }
    end
  end
end
