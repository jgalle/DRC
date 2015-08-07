class ContextRecoveryMethodsController < ApplicationController
  # GET /context_recovery_methods
  # GET /context_recovery_methods.json
  def index
    @context_recovery_methods = ContextRecoveryMethod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_recovery_methods }
    end
  end

  # GET /context_recovery_methods/1
  # GET /context_recovery_methods/1.json
  def show
    @context_recovery_method = ContextRecoveryMethod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_recovery_method }
    end
  end

  # GET /context_recovery_methods/new
  # GET /context_recovery_methods/new.json
  def new
    @context_recovery_method = ContextRecoveryMethod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_recovery_method }
    end
  end

  # GET /context_recovery_methods/1/edit
  def edit
    @context_recovery_method = ContextRecoveryMethod.find(params[:id])
  end

  # POST /context_recovery_methods
  # POST /context_recovery_methods.json
  def create
    @context_recovery_method = ContextRecoveryMethod.new(params[:context_recovery_method])

    respond_to do |format|
      if @context_recovery_method.save
        format.html { redirect_to @context_recovery_method, notice: 'Context recovery method was successfully created.' }
        format.json { render json: @context_recovery_method, status: :created, location: @context_recovery_method }
      else
        format.html { render action: "new" }
        format.json { render json: @context_recovery_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_recovery_methods/1
  # PUT /context_recovery_methods/1.json
  def update
    @context_recovery_method = ContextRecoveryMethod.find(params[:id])

    respond_to do |format|
      if @context_recovery_method.update_attributes(params[:context_recovery_method])
        format.html { redirect_to @context_recovery_method, notice: 'Context recovery method was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_recovery_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_recovery_methods/1
  # DELETE /context_recovery_methods/1.json
  def destroy
    @context_recovery_method = ContextRecoveryMethod.find(params[:id])
    @context_recovery_method.destroy

    respond_to do |format|
      format.html { redirect_to context_recovery_methods_url }
      format.json { head :no_content }
    end
  end
end
