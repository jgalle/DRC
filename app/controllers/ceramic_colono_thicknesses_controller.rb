class CeramicColonoThicknessesController < ApplicationController
  # GET /ceramic_colono_thicknesses
  # GET /ceramic_colono_thicknesses.json
  def index
    @ceramic_colono_thicknesses = CeramicColonoThickness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_colono_thicknesses }
    end
  end

  # GET /ceramic_colono_thicknesses/1
  # GET /ceramic_colono_thicknesses/1.json
  def show
    @ceramic_colono_thickness = CeramicColonoThickness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_colono_thickness }
    end
  end

  # GET /ceramic_colono_thicknesses/new
  # GET /ceramic_colono_thicknesses/new.json
  def new
    @ceramic_colono_thickness = CeramicColonoThickness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_colono_thickness }
    end
  end

  # GET /ceramic_colono_thicknesses/1/edit
  def edit
    @ceramic_colono_thickness = CeramicColonoThickness.find(params[:id])
  end

  # POST /ceramic_colono_thicknesses
  # POST /ceramic_colono_thicknesses.json
  def create
    @ceramic_colono_thickness = CeramicColonoThickness.new(params[:ceramic_colono_thickness])

    respond_to do |format|
      if @ceramic_colono_thickness.save
        format.html { redirect_to @ceramic_colono_thickness, notice: 'Ceramic colono thickness was successfully created.' }
        format.json { render json: @ceramic_colono_thickness, status: :created, location: @ceramic_colono_thickness }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_colono_thickness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_colono_thicknesses/1
  # PUT /ceramic_colono_thicknesses/1.json
  def update
    @ceramic_colono_thickness = CeramicColonoThickness.find(params[:id])

    respond_to do |format|
      if @ceramic_colono_thickness.update_attributes(params[:ceramic_colono_thickness])
        format.html { redirect_to @ceramic_colono_thickness, notice: 'Ceramic colono thickness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_colono_thickness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_colono_thicknesses/1
  # DELETE /ceramic_colono_thicknesses/1.json
  def destroy
    @ceramic_colono_thickness = CeramicColonoThickness.find(params[:id])
    @ceramic_colono_thickness.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_colono_thicknesses_url }
      format.json { head :no_content }
    end
  end
end
