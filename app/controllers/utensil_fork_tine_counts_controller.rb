class UtensilForkTineCountsController < ApplicationController
  # GET /utensil_fork_tine_counts
  # GET /utensil_fork_tine_counts.json
  def index
    @utensil_fork_tine_counts = UtensilForkTineCount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensil_fork_tine_counts }
    end
  end

  # GET /utensil_fork_tine_counts/1
  # GET /utensil_fork_tine_counts/1.json
  def show
    @utensil_fork_tine_count = UtensilForkTineCount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil_fork_tine_count }
    end
  end

  # GET /utensil_fork_tine_counts/new
  # GET /utensil_fork_tine_counts/new.json
  def new
    @utensil_fork_tine_count = UtensilForkTineCount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utensil_fork_tine_count }
    end
  end

  # GET /utensil_fork_tine_counts/1/edit
  def edit
    @utensil_fork_tine_count = UtensilForkTineCount.find(params[:id])
  end

  # POST /utensil_fork_tine_counts
  # POST /utensil_fork_tine_counts.json
  def create
    @utensil_fork_tine_count = UtensilForkTineCount.new(params[:utensil_fork_tine_count])

    respond_to do |format|
      if @utensil_fork_tine_count.save
        format.html { redirect_to @utensil_fork_tine_count, notice: 'Utensil fork tine count was successfully created.' }
        format.json { render json: @utensil_fork_tine_count, status: :created, location: @utensil_fork_tine_count }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil_fork_tine_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensil_fork_tine_counts/1
  # PUT /utensil_fork_tine_counts/1.json
  def update
    @utensil_fork_tine_count = UtensilForkTineCount.find(params[:id])

    respond_to do |format|
      if @utensil_fork_tine_count.update_attributes(params[:utensil_fork_tine_count])
        format.html { redirect_to @utensil_fork_tine_count, notice: 'Utensil fork tine count was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil_fork_tine_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensil_fork_tine_counts/1
  # DELETE /utensil_fork_tine_counts/1.json
  def destroy
    @utensil_fork_tine_count = UtensilForkTineCount.find(params[:id])
    @utensil_fork_tine_count.destroy

    respond_to do |format|
      format.html { redirect_to utensil_fork_tine_counts_url }
      format.json { head :no_content }
    end
  end
end
