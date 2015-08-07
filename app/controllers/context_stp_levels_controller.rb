class ContextStpLevelsController < ApplicationController
  # GET /context_stp_levels
  # GET /context_stp_levels.json
  def index
    @context_stp_levels = ContextStpLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_stp_levels }
    end
  end

  # GET /context_stp_levels/1
  # GET /context_stp_levels/1.json
  def show
    @context_stp_level = ContextStpLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_stp_level }
    end
  end

  # GET /context_stp_levels/new
  # GET /context_stp_levels/new.json
  def new
    @context_stp_level = ContextStpLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_stp_level }
    end
  end

  # GET /context_stp_levels/1/edit
  def edit
    @context_stp_level = ContextStpLevel.find(params[:id])
  end

  # POST /context_stp_levels
  # POST /context_stp_levels.json
  def create
    @context_stp_level = ContextStpLevel.new(params[:context_stp_level])

    respond_to do |format|
      if @context_stp_level.save
        format.html { redirect_to @context_stp_level, notice: 'Context stp level was successfully created.' }
        format.json { render json: @context_stp_level, status: :created, location: @context_stp_level }
      else
        format.html { render action: "new" }
        format.json { render json: @context_stp_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_stp_levels/1
  # PUT /context_stp_levels/1.json
  def update
    @context_stp_level = ContextStpLevel.find(params[:id])

    respond_to do |format|
      if @context_stp_level.update_attributes(params[:context_stp_level])
        format.html { redirect_to @context_stp_level, notice: 'Context stp level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_stp_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_stp_levels/1
  # DELETE /context_stp_levels/1.json
  def destroy
    @context_stp_level = ContextStpLevel.find(params[:id])
    @context_stp_level.destroy

    respond_to do |format|
      format.html { redirect_to context_stp_levels_url }
      format.json { head :no_content }
    end
  end
end
