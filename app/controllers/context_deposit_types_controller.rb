class ContextDepositTypesController < ApplicationController
  # GET /context_deposit_types
  # GET /context_deposit_types.json
  def index
    @context_deposit_types = ContextDepositType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_deposit_types }
    end
  end

  # GET /context_deposit_types/1
  # GET /context_deposit_types/1.json
  def show
    @context_deposit_type = ContextDepositType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_deposit_type }
    end
  end

  # GET /context_deposit_types/new
  # GET /context_deposit_types/new.json
  def new
    @context_deposit_type = ContextDepositType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_deposit_type }
    end
  end

  # GET /context_deposit_types/1/edit
  def edit
    @context_deposit_type = ContextDepositType.find(params[:id])
  end

  # POST /context_deposit_types
  # POST /context_deposit_types.json
  def create
    @context_deposit_type = ContextDepositType.new(params[:context_deposit_type])

    respond_to do |format|
      if @context_deposit_type.save
        format.html { redirect_to @context_deposit_type, notice: 'Context deposit type was successfully created.' }
        format.json { render json: @context_deposit_type, status: :created, location: @context_deposit_type }
      else
        format.html { render action: "new" }
        format.json { render json: @context_deposit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_deposit_types/1
  # PUT /context_deposit_types/1.json
  def update
    @context_deposit_type = ContextDepositType.find(params[:id])

    respond_to do |format|
      if @context_deposit_type.update_attributes(params[:context_deposit_type])
        format.html { redirect_to @context_deposit_type, notice: 'Context deposit type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_deposit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_deposit_types/1
  # DELETE /context_deposit_types/1.json
  def destroy
    @context_deposit_type = ContextDepositType.find(params[:id])
    @context_deposit_type.destroy

    respond_to do |format|
      format.html { redirect_to context_deposit_types_url }
      format.json { head :no_content }
    end
  end
end
