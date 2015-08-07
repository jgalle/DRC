class BeadDecorationsController < ApplicationController
  # GET /bead_decorations
  # GET /bead_decorations.json
  def index
    @bead_decorations = BeadDecoration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bead_decorations }
    end
  end

  # GET /bead_decorations/1
  # GET /bead_decorations/1.json
  def show
    @bead_decoration = BeadDecoration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead_decoration }
    end
  end

  # GET /bead_decorations/new
  # GET /bead_decorations/new.json
  def new
    @bead_decoration = BeadDecoration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bead_decoration }
    end
  end

  # GET /bead_decorations/1/edit
  def edit
    @bead_decoration = BeadDecoration.find(params[:id])
  end

  # POST /bead_decorations
  # POST /bead_decorations.json
  def create
    @bead_decoration = BeadDecoration.new(params[:bead_decoration])

    respond_to do |format|
      if @bead_decoration.save
        format.html { redirect_to @bead_decoration, notice: 'Bead decoration was successfully created.' }
        format.json { render json: @bead_decoration, status: :created, location: @bead_decoration }
      else
        format.html { render action: "new" }
        format.json { render json: @bead_decoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bead_decorations/1
  # PUT /bead_decorations/1.json
  def update
    @bead_decoration = BeadDecoration.find(params[:id])

    respond_to do |format|
      if @bead_decoration.update_attributes(params[:bead_decoration])
        format.html { redirect_to @bead_decoration, notice: 'Bead decoration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead_decoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bead_decorations/1
  # DELETE /bead_decorations/1.json
  def destroy
    @bead_decoration = BeadDecoration.find(params[:id])
    @bead_decoration.destroy

    respond_to do |format|
      format.html { redirect_to bead_decorations_url }
      format.json { head :no_content }
    end
  end
end
