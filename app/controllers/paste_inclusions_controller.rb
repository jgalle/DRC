class PasteInclusionsController < ApplicationController
  # GET /paste_inclusions
  # GET /paste_inclusions.json
  def index
    @paste_inclusions = PasteInclusion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paste_inclusions }
    end
  end

  # GET /paste_inclusions/1
  # GET /paste_inclusions/1.json
  def show
    @paste_inclusion = PasteInclusion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paste_inclusion }
    end
  end

  # GET /paste_inclusions/new
  # GET /paste_inclusions/new.json
  def new
    @paste_inclusion = PasteInclusion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paste_inclusion }
    end
  end

  # GET /paste_inclusions/1/edit
  def edit
    @paste_inclusion = PasteInclusion.find(params[:id])
  end

  # POST /paste_inclusions
  # POST /paste_inclusions.json
  def create
    @paste_inclusion = PasteInclusion.new(params[:paste_inclusion])

    respond_to do |format|
      if @paste_inclusion.save
        format.html { redirect_to @paste_inclusion, notice: 'Paste inclusion was successfully created.' }
        format.json { render json: @paste_inclusion, status: :created, location: @paste_inclusion }
      else
        format.html { render action: "new" }
        format.json { render json: @paste_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /paste_inclusions/1
  # PUT /paste_inclusions/1.json
  def update
    @paste_inclusion = PasteInclusion.find(params[:id])

    respond_to do |format|
      if @paste_inclusion.update_attributes(params[:paste_inclusion])
        format.html { redirect_to @paste_inclusion, notice: 'Paste inclusion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paste_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paste_inclusions/1
  # DELETE /paste_inclusions/1.json
  def destroy
    @paste_inclusion = PasteInclusion.find(params[:id])
    @paste_inclusion.destroy

    respond_to do |format|
      format.html { redirect_to paste_inclusions_url }
      format.json { head :no_content }
    end
  end
end
