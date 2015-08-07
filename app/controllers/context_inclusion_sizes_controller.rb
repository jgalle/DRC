class ContextInclusionSizesController < ApplicationController
  # GET /context_inclusion_sizes
  # GET /context_inclusion_sizes.json
  def index
    @context_inclusion_sizes = ContextInclusionSize.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_inclusion_sizes }
    end
  end

  # GET /context_inclusion_sizes/1
  # GET /context_inclusion_sizes/1.json
  def show
    @context_inclusion_size = ContextInclusionSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_inclusion_size }
    end
  end

  # GET /context_inclusion_sizes/new
  # GET /context_inclusion_sizes/new.json
  def new
    @context_inclusion_size = ContextInclusionSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_inclusion_size }
    end
  end

  # GET /context_inclusion_sizes/1/edit
  def edit
    @context_inclusion_size = ContextInclusionSize.find(params[:id])
  end

  # POST /context_inclusion_sizes
  # POST /context_inclusion_sizes.json
  def create
    @context_inclusion_size = ContextInclusionSize.new(params[:context_inclusion_size])

    respond_to do |format|
      if @context_inclusion_size.save
        format.html { redirect_to @context_inclusion_size, notice: 'Context inclusion size was successfully created.' }
        format.json { render json: @context_inclusion_size, status: :created, location: @context_inclusion_size }
      else
        format.html { render action: "new" }
        format.json { render json: @context_inclusion_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_inclusion_sizes/1
  # PUT /context_inclusion_sizes/1.json
  def update
    @context_inclusion_size = ContextInclusionSize.find(params[:id])

    respond_to do |format|
      if @context_inclusion_size.update_attributes(params[:context_inclusion_size])
        format.html { redirect_to @context_inclusion_size, notice: 'Context inclusion size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_inclusion_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_inclusion_sizes/1
  # DELETE /context_inclusion_sizes/1.json
  def destroy
    @context_inclusion_size = ContextInclusionSize.find(params[:id])
    @context_inclusion_size.destroy

    respond_to do |format|
      format.html { redirect_to context_inclusion_sizes_url }
      format.json { head :no_content }
    end
  end
end
