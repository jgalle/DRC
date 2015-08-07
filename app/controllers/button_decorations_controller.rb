class ButtonDecorationsController < ApplicationController
  # GET /button_decorations
  # GET /button_decorations.json
  def index
    @button_decorations = ButtonDecoration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_decorations }
    end
  end

  # GET /button_decorations/1
  # GET /button_decorations/1.json
  def show
    @button_decoration = ButtonDecoration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_decoration }
    end
  end

  # GET /button_decorations/new
  # GET /button_decorations/new.json
  def new
    @button_decoration = ButtonDecoration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_decoration }
    end
  end

  # GET /button_decorations/1/edit
  def edit
    @button_decoration = ButtonDecoration.find(params[:id])
  end

  # POST /button_decorations
  # POST /button_decorations.json
  def create
    @button_decoration = ButtonDecoration.new(params[:button_decoration])

    respond_to do |format|
      if @button_decoration.save
        format.html { redirect_to @button_decoration, notice: 'Button decoration was successfully created.' }
        format.json { render json: @button_decoration, status: :created, location: @button_decoration }
      else
        format.html { render action: "new" }
        format.json { render json: @button_decoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_decorations/1
  # PUT /button_decorations/1.json
  def update
    @button_decoration = ButtonDecoration.find(params[:id])

    respond_to do |format|
      if @button_decoration.update_attributes(params[:button_decoration])
        format.html { redirect_to @button_decoration, notice: 'Button decoration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_decoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_decorations/1
  # DELETE /button_decorations/1.json
  def destroy
    @button_decoration = ButtonDecoration.find(params[:id])
    @button_decoration.destroy

    respond_to do |format|
      format.html { redirect_to button_decorations_url }
      format.json { head :no_content }
    end
  end
end
