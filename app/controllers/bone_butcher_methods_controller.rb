class BoneButcherMethodsController < ApplicationController
  # GET /bone_butcher_methods
  # GET /bone_butcher_methods.json
  def index
    @bone_butcher_methods = BoneButcherMethod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bone_butcher_methods }
    end
  end

  # GET /bone_butcher_methods/1
  # GET /bone_butcher_methods/1.json
  def show
    @bone_butcher_method = BoneButcherMethod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone_butcher_method }
    end
  end

  # GET /bone_butcher_methods/new
  # GET /bone_butcher_methods/new.json
  def new
    @bone_butcher_method = BoneButcherMethod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bone_butcher_method }
    end
  end

  # GET /bone_butcher_methods/1/edit
  def edit
    @bone_butcher_method = BoneButcherMethod.find(params[:id])
  end

  # POST /bone_butcher_methods
  # POST /bone_butcher_methods.json
  def create
    @bone_butcher_method = BoneButcherMethod.new(params[:bone_butcher_method])

    respond_to do |format|
      if @bone_butcher_method.save
        format.html { redirect_to @bone_butcher_method, notice: 'Bone butcher method was successfully created.' }
        format.json { render json: @bone_butcher_method, status: :created, location: @bone_butcher_method }
      else
        format.html { render action: "new" }
        format.json { render json: @bone_butcher_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bone_butcher_methods/1
  # PUT /bone_butcher_methods/1.json
  def update
    @bone_butcher_method = BoneButcherMethod.find(params[:id])

    respond_to do |format|
      if @bone_butcher_method.update_attributes(params[:bone_butcher_method])
        format.html { redirect_to @bone_butcher_method, notice: 'Bone butcher method was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone_butcher_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bone_butcher_methods/1
  # DELETE /bone_butcher_methods/1.json
  def destroy
    @bone_butcher_method = BoneButcherMethod.find(params[:id])
    @bone_butcher_method.destroy

    respond_to do |format|
      format.html { redirect_to bone_butcher_methods_url }
      format.json { head :no_content }
    end
  end
end
