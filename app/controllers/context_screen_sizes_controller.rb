class ContextScreenSizesController < ApplicationController
  # GET /context_screen_sizes
  # GET /context_screen_sizes.json
  def index
    @context_screen_sizes = ContextScreenSize.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_screen_sizes }
    end
  end

  # GET /context_screen_sizes/1
  # GET /context_screen_sizes/1.json
  def show
    @context_screen_size = ContextScreenSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_screen_size }
    end
  end

  # GET /context_screen_sizes/new
  # GET /context_screen_sizes/new.json
  def new
    @context_screen_size = ContextScreenSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @context_screen_size }
    end
  end

  # GET /context_screen_sizes/1/edit
  def edit
    @context_screen_size = ContextScreenSize.find(params[:id])
  end

  # POST /context_screen_sizes
  # POST /context_screen_sizes.json
  def create
    @context_screen_size = ContextScreenSize.new(params[:context_screen_size])

    respond_to do |format|
      if @context_screen_size.save
        format.html { redirect_to @context_screen_size, notice: 'Context screen size was successfully created.' }
        format.json { render json: @context_screen_size, status: :created, location: @context_screen_size }
      else
        format.html { render action: "new" }
        format.json { render json: @context_screen_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_screen_sizes/1
  # PUT /context_screen_sizes/1.json
  def update
    @context_screen_size = ContextScreenSize.find(params[:id])

    respond_to do |format|
      if @context_screen_size.update_attributes(params[:context_screen_size])
        format.html { redirect_to @context_screen_size, notice: 'Context screen size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_screen_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_screen_sizes/1
  # DELETE /context_screen_sizes/1.json
  def destroy
    @context_screen_size = ContextScreenSize.find(params[:id])
    @context_screen_size.destroy

    respond_to do |format|
      format.html { redirect_to context_screen_sizes_url }
      format.json { head :no_content }
    end
  end
end
