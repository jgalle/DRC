class ButtonShankStylesController < ApplicationController
  # GET /button_shank_styles
  # GET /button_shank_styles.json
  def index
    @button_shank_styles = ButtonShankStyle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_shank_styles }
    end
  end

  # GET /button_shank_styles/1
  # GET /button_shank_styles/1.json
  def show
    @button_shank_style = ButtonShankStyle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_shank_style }
    end
  end

  # GET /button_shank_styles/new
  # GET /button_shank_styles/new.json
  def new
    @button_shank_style = ButtonShankStyle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_shank_style }
    end
  end

  # GET /button_shank_styles/1/edit
  def edit
    @button_shank_style = ButtonShankStyle.find(params[:id])
  end

  # POST /button_shank_styles
  # POST /button_shank_styles.json
  def create
    @button_shank_style = ButtonShankStyle.new(params[:button_shank_style])

    respond_to do |format|
      if @button_shank_style.save
        format.html { redirect_to @button_shank_style, notice: 'Button shank style was successfully created.' }
        format.json { render json: @button_shank_style, status: :created, location: @button_shank_style }
      else
        format.html { render action: "new" }
        format.json { render json: @button_shank_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_shank_styles/1
  # PUT /button_shank_styles/1.json
  def update
    @button_shank_style = ButtonShankStyle.find(params[:id])

    respond_to do |format|
      if @button_shank_style.update_attributes(params[:button_shank_style])
        format.html { redirect_to @button_shank_style, notice: 'Button shank style was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_shank_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_shank_styles/1
  # DELETE /button_shank_styles/1.json
  def destroy
    @button_shank_style = ButtonShankStyle.find(params[:id])
    @button_shank_style.destroy

    respond_to do |format|
      format.html { redirect_to button_shank_styles_url }
      format.json { head :no_content }
    end
  end
end
