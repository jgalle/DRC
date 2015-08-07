class ContextFineSedimentsController < ApplicationController
  # GET /context_fine_sediments
  # GET /context_fine_sediments.json
  def index
    @context_fine_sediments = ContextFineSediment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_fine_sediments }
    end
  end

  # GET /context_fine_sediments/1
  # GET /context_fine_sediments/1.json
  def show
    @context_fine_sediment = ContextFineSediment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_fine_sediment }
    end
  end

  # GET /context_fine_sediments/new
  # GET /context_fine_sediments/new.json
  def new
    @context_fine_sediment = ContextFineSediment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_fine_sediment }
    end
  end

  # GET /context_fine_sediments/1/edit
  def edit
    @context_fine_sediment = ContextFineSediment.find(params[:id])
  end

  # POST /context_fine_sediments
  # POST /context_fine_sediments.json
  def create
    @context_fine_sediment = ContextFineSediment.new(params[:context_fine_sediment])

    respond_to do |format|
      if @context_fine_sediment.save
        format.html { redirect_to @context_fine_sediment, notice: 'Context fine sediment was successfully created.' }
        format.json { render json: @context_fine_sediment, status: :created, location: @context_fine_sediment }
      else
        format.html { render action: "new" }
        format.json { render json: @context_fine_sediment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_fine_sediments/1
  # PUT /context_fine_sediments/1.json
  def update
    @context_fine_sediment = ContextFineSediment.find(params[:id])

    respond_to do |format|
      if @context_fine_sediment.update_attributes(params[:context_fine_sediment])
        format.html { redirect_to @context_fine_sediment, notice: 'Context fine sediment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_fine_sediment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_fine_sediments/1
  # DELETE /context_fine_sediments/1.json
  def destroy
    @context_fine_sediment = ContextFineSediment.find(params[:id])
    @context_fine_sediment.destroy

    respond_to do |format|
      format.html { redirect_to context_fine_sediments_url }
      format.json { head :no_content }
    end
  end
end
