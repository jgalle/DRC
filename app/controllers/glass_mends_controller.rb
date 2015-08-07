class GlassMendsController < ApplicationController
  # GET /glass_mends
  # GET /glass_mends.json
  def index
    @glass_mends = GlassMend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glass_mends }
    end
  end

  # GET /glass_mends/1
  # GET /glass_mends/1.json
  def show
    @glass_mend = GlassMend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass_mend }
    end
  end

  # GET /glass_mends/new
  # GET /glass_mends/new.json
  def new
    @glass_mend = GlassMend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glass_mend }
    end
  end

  # GET /glass_mends/1/edit
  def edit
    @glass_mend = GlassMend.find(params[:id])
  end

  # POST /glass_mends
  # POST /glass_mends.json
  def create
    @glass_mend = GlassMend.new(params[:glass_mend])

    respond_to do |format|
      if @glass_mend.save
        format.html { redirect_to @glass_mend, notice: 'Glass mend was successfully created.' }
        format.json { render json: @glass_mend, status: :created, location: @glass_mend }
      else
        format.html { render action: "new" }
        format.json { render json: @glass_mend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glass_mends/1
  # PUT /glass_mends/1.json
  def update
    @glass_mend = GlassMend.find(params[:id])

    respond_to do |format|
      if @glass_mend.update_attributes(params[:glass_mend])
        format.html { redirect_to @glass_mend, notice: 'Glass mend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass_mend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_mends/1
  # DELETE /glass_mends/1.json
  def destroy
    @glass_mend = GlassMend.find(params[:id])
    @glass_mend.destroy

    respond_to do |format|
      format.html { redirect_to glass_mends_url }
      format.json { head :no_content }
    end
  end
end
