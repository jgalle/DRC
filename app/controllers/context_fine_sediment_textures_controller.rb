class ContextFineSedimentTexturesController < ApplicationController
  # GET /context_fine_sediment_textures
  # GET /context_fine_sediment_textures.json
  def index
    @context_fine_sediment_textures = ContextFineSedimentTexture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_fine_sediment_textures }
    end
  end

  # GET /context_fine_sediment_textures/1
  # GET /context_fine_sediment_textures/1.json
  def show
    @context_fine_sediment_texture = ContextFineSedimentTexture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_fine_sediment_texture }
    end
  end

  # GET /context_fine_sediment_textures/new
  # GET /context_fine_sediment_textures/new.json
  def new
    @context_fine_sediment_texture = ContextFineSedimentTexture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_fine_sediment_texture }
    end
  end

  # GET /context_fine_sediment_textures/1/edit
  def edit
    @context_fine_sediment_texture = ContextFineSedimentTexture.find(params[:id])
  end

  # POST /context_fine_sediment_textures
  # POST /context_fine_sediment_textures.json
  def create
    @context_fine_sediment_texture = ContextFineSedimentTexture.new(params[:context_fine_sediment_texture])

    respond_to do |format|
      if @context_fine_sediment_texture.save
        format.html { redirect_to @context_fine_sediment_texture, notice: 'Context fine sediment texture was successfully created.' }
        format.json { render json: @context_fine_sediment_texture, status: :created, location: @context_fine_sediment_texture }
      else
        format.html { render action: "new" }
        format.json { render json: @context_fine_sediment_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_fine_sediment_textures/1
  # PUT /context_fine_sediment_textures/1.json
  def update
    @context_fine_sediment_texture = ContextFineSedimentTexture.find(params[:id])

    respond_to do |format|
      if @context_fine_sediment_texture.update_attributes(params[:context_fine_sediment_texture])
        format.html { redirect_to @context_fine_sediment_texture, notice: 'Context fine sediment texture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_fine_sediment_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_fine_sediment_textures/1
  # DELETE /context_fine_sediment_textures/1.json
  def destroy
    @context_fine_sediment_texture = ContextFineSedimentTexture.find(params[:id])
    @context_fine_sediment_texture.destroy

    respond_to do |format|
      format.html { redirect_to context_fine_sediment_textures_url }
      format.json { head :no_content }
    end
  end
end
