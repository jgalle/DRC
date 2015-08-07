class CeramicPasteInclusionsController < ApplicationController
  # GET /ceramic_paste_inclusions
  # GET /ceramic_paste_inclusions.json
  def index
    @ceramic_paste_inclusions = CeramicPasteInclusion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_paste_inclusions }
    end
  end

  # GET /ceramic_paste_inclusions/1
  # GET /ceramic_paste_inclusions/1.json
  def show
    @ceramic_paste_inclusion = CeramicPasteInclusion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_paste_inclusion }
    end
  end

  # GET /ceramic_paste_inclusions/new
  # GET /ceramic_paste_inclusions/new.json
  def new
    @ceramic_paste_inclusion = CeramicPasteInclusion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_paste_inclusion }
    end
  end

  # GET /ceramic_paste_inclusions/1/edit
  def edit
    @ceramic_paste_inclusion = CeramicPasteInclusion.find(params[:id])
  end

  # POST /ceramic_paste_inclusions
  # POST /ceramic_paste_inclusions.json
  def create
    @ceramic_paste_inclusion = CeramicPasteInclusion.new(params[:ceramic_paste_inclusion])

    respond_to do |format|
      if @ceramic_paste_inclusion.save
        format.html { redirect_to @ceramic_paste_inclusion, notice: 'Ceramic paste inclusion was successfully created.' }
        format.json { render json: @ceramic_paste_inclusion, status: :created, location: @ceramic_paste_inclusion }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_paste_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_paste_inclusions/1
  # PUT /ceramic_paste_inclusions/1.json
  def update
    @ceramic_paste_inclusion = CeramicPasteInclusion.find(params[:id])

    respond_to do |format|
      if @ceramic_paste_inclusion.update_attributes(params[:ceramic_paste_inclusion])
        format.html { redirect_to @ceramic_paste_inclusion, notice: 'Ceramic paste inclusion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_paste_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_paste_inclusions/1
  # DELETE /ceramic_paste_inclusions/1.json
  def destroy
    @ceramic_paste_inclusion = CeramicPasteInclusion.find(params[:id])
    @ceramic_paste_inclusion.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_paste_inclusions_url }
      format.json { head :no_content }
    end
  end
end
