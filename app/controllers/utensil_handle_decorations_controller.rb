class UtensilHandleDecorationsController < ApplicationController
  # GET /utensil_handle_decorations
  # GET /utensil_handle_decorations.json
  def index
    @utensil_handle_decorations = UtensilHandleDecoration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensil_handle_decorations }
    end
  end

  # GET /utensil_handle_decorations/1
  # GET /utensil_handle_decorations/1.json
  def show
    @utensil_handle_decoration = UtensilHandleDecoration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil_handle_decoration }
    end
  end

  # GET /utensil_handle_decorations/new
  # GET /utensil_handle_decorations/new.json
  def new
    @utensil_handle_decoration = UtensilHandleDecoration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utensil_handle_decoration }
    end
  end

  # GET /utensil_handle_decorations/1/edit
  def edit
    @utensil_handle_decoration = UtensilHandleDecoration.find(params[:id])
  end

  # POST /utensil_handle_decorations
  # POST /utensil_handle_decorations.json
  def create
    @utensil_handle_decoration = UtensilHandleDecoration.new(params[:utensil_handle_decoration])

    respond_to do |format|
      if @utensil_handle_decoration.save
        format.html { redirect_to @utensil_handle_decoration, notice: 'Utensil handle decoration was successfully created.' }
        format.json { render json: @utensil_handle_decoration, status: :created, location: @utensil_handle_decoration }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil_handle_decoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensil_handle_decorations/1
  # PUT /utensil_handle_decorations/1.json
  def update
    @utensil_handle_decoration = UtensilHandleDecoration.find(params[:id])

    respond_to do |format|
      if @utensil_handle_decoration.update_attributes(params[:utensil_handle_decoration])
        format.html { redirect_to @utensil_handle_decoration, notice: 'Utensil handle decoration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil_handle_decoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensil_handle_decorations/1
  # DELETE /utensil_handle_decorations/1.json
  def destroy
    @utensil_handle_decoration = UtensilHandleDecoration.find(params[:id])
    @utensil_handle_decoration.destroy

    respond_to do |format|
      format.html { redirect_to utensil_handle_decorations_url }
      format.json { head :no_content }
    end
  end
end
