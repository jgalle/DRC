class ButtonTypesController < ApplicationController
  # GET /button_types
  # GET /button_types.json
  def index
    @button_types = ButtonType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_types }
    end
  end

  # GET /button_types/1
  # GET /button_types/1.json
  def show
    @button_type = ButtonType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_type }
    end
  end

  # GET /button_types/new
  # GET /button_types/new.json
  def new
    @button_type = ButtonType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_type }
    end
  end

  # GET /button_types/1/edit
  def edit
    @button_type = ButtonType.find(params[:id])
  end

  # POST /button_types
  # POST /button_types.json
  def create
    @button_type = ButtonType.new(params[:button_type])

    respond_to do |format|
      if @button_type.save
        format.html { redirect_to @button_type, notice: 'Button type was successfully created.' }
        format.json { render json: @button_type, status: :created, location: @button_type }
      else
        format.html { render action: "new" }
        format.json { render json: @button_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_types/1
  # PUT /button_types/1.json
  def update
    @button_type = ButtonType.find(params[:id])

    respond_to do |format|
      if @button_type.update_attributes(params[:button_type])
        format.html { redirect_to @button_type, notice: 'Button type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_types/1
  # DELETE /button_types/1.json
  def destroy
    @button_type = ButtonType.find(params[:id])
    @button_type.destroy

    respond_to do |format|
      format.html { redirect_to button_types_url }
      format.json { head :no_content }
    end
  end
end
