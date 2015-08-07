class BoneSexesController < ApplicationController
  # GET /bone_sexes
  # GET /bone_sexes.json
  def index
    @bone_sexes = BoneSex.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_sexes }
    end
  end

  # GET /bone_sexes/1
  # GET /bone_sexes/1.json
  def show
    @bone_sex = BoneSex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_sex }
    end
  end

  # GET /bone_sexes/new
  # GET /bone_sexes/new.json
  def new
    @bone_sex = BoneSex.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_sex }
    end
  end

  # GET /bone_sexes/1/edit
  def edit
    @bone_sex = BoneSex.find(params[:id])
  end

  # POST /bone_sexes
  # POST /bone_sexes.json
  def create
    @bone_sex = BoneSex.new(params[:bone_sex])

    respond_to do |format|
      if @bone_sex.save
        format.html { redirect_to @bone_sex, notice: 'Bone sex was successfully created.' }
        format.json { render json: @bone_sex, status: :created, location: @bone_sex }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_sex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_sexes/1
  # PUT /bone_sexes/1.json
  def update
    @bone_sex = BoneSex.find(params[:id])

    respond_to do |format|
      if @bone_sex.update_attributes(params[:bone_sex])
        format.html { redirect_to @bone_sex, notice: 'Bone sex was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_sex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_sexes/1
  # DELETE /bone_sexes/1.json
  def destroy
    @bone_sex = BoneSex.find(params[:id])
    @bone_sex.destroy

    respond_to do |format|
      format.html { redirect_to bone_sexes_url }
      format.json { head :no_content }
    end
  end
end
