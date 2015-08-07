class ContextInclusionDescriptionsController < ApplicationController
  # GET /context_inclusion_descriptions
  # GET /context_inclusion_descriptions.json
  def index
    @context_inclusion_descriptions = ContextInclusionDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_inclusion_descriptions }
    end
  end

  # GET /context_inclusion_descriptions/1
  # GET /context_inclusion_descriptions/1.json
  def show
    @context_inclusion_description = ContextInclusionDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_inclusion_description }
    end
  end

  # GET /context_inclusion_descriptions/new
  # GET /context_inclusion_descriptions/new.json
  def new
    @context_inclusion_description = ContextInclusionDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_inclusion_description }
    end
  end

  # GET /context_inclusion_descriptions/1/edit
  def edit
    @context_inclusion_description = ContextInclusionDescription.find(params[:id])
  end

  # POST /context_inclusion_descriptions
  # POST /context_inclusion_descriptions.json
  def create
    @context_inclusion_description = ContextInclusionDescription.new(params[:context_inclusion_description])

    respond_to do |format|
      if @context_inclusion_description.save
        format.html { redirect_to @context_inclusion_description, notice: 'Context inclusion description was successfully created.' }
        format.json { render json: @context_inclusion_description, status: :created, location: @context_inclusion_description }
      else
        format.html { render action: "new" }
        format.json { render json: @context_inclusion_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_inclusion_descriptions/1
  # PUT /context_inclusion_descriptions/1.json
  def update
    @context_inclusion_description = ContextInclusionDescription.find(params[:id])

    respond_to do |format|
      if @context_inclusion_description.update_attributes(params[:context_inclusion_description])
        format.html { redirect_to @context_inclusion_description, notice: 'Context inclusion description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_inclusion_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_inclusion_descriptions/1
  # DELETE /context_inclusion_descriptions/1.json
  def destroy
    @context_inclusion_description = ContextInclusionDescription.find(params[:id])
    @context_inclusion_description.destroy

    respond_to do |format|
      format.html { redirect_to context_inclusion_descriptions_url }
      format.json { head :no_content }
    end
  end
end
