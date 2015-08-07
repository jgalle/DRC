class ButtonJoinMethodsController < ApplicationController
  # GET /button_join_methods
  # GET /button_join_methods.json
  def index
    @button_join_methods = ButtonJoinMethod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_join_methods }
    end
  end

  # GET /button_join_methods/1
  # GET /button_join_methods/1.json
  def show
    @button_join_method = ButtonJoinMethod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_join_method }
    end
  end

  # GET /button_join_methods/new
  # GET /button_join_methods/new.json
  def new
    @button_join_method = ButtonJoinMethod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_join_method }
    end
  end

  # GET /button_join_methods/1/edit
  def edit
    @button_join_method = ButtonJoinMethod.find(params[:id])
  end

  # POST /button_join_methods
  # POST /button_join_methods.json
  def create
    @button_join_method = ButtonJoinMethod.new(params[:button_join_method])

    respond_to do |format|
      if @button_join_method.save
        format.html { redirect_to @button_join_method, notice: 'Button join method was successfully created.' }
        format.json { render json: @button_join_method, status: :created, location: @button_join_method }
      else
        format.html { render action: "new" }
        format.json { render json: @button_join_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_join_methods/1
  # PUT /button_join_methods/1.json
  def update
    @button_join_method = ButtonJoinMethod.find(params[:id])

    respond_to do |format|
      if @button_join_method.update_attributes(params[:button_join_method])
        format.html { redirect_to @button_join_method, notice: 'Button join method was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_join_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_join_methods/1
  # DELETE /button_join_methods/1.json
  def destroy
    @button_join_method = ButtonJoinMethod.find(params[:id])
    @button_join_method.destroy

    respond_to do |format|
      format.html { redirect_to button_join_methods_url }
      format.json { head :no_content }
    end
  end
end
