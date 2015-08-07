class CeramicStyElemGenresController < ApplicationController
  before_action :set_ceramic_sty_elem_genre, only: [:show, :edit, :update, :destroy]

  # GET /ceramic_sty_elem_genres
  # GET /ceramic_sty_elem_genres.json
  def index
    @ceramic_sty_elem_genres = CeramicStyElemGenre.all
  end

  # GET /ceramic_sty_elem_genres/1
  # GET /ceramic_sty_elem_genres/1.json
  def show
  end

  # GET /ceramic_sty_elem_genres/new
  def new
    @ceramic_sty_elem_genre = CeramicStyElemGenre.new
  end

  # GET /ceramic_sty_elem_genres/1/edit
  def edit
  end

  # POST /ceramic_sty_elem_genres
  # POST /ceramic_sty_elem_genres.json
  def create
    @ceramic_sty_elem_genre = CeramicStyElemGenre.new(ceramic_sty_elem_genre_params)

    respond_to do |format|
      if @ceramic_sty_elem_genre.save
        format.html { redirect_to @ceramic_sty_elem_genre, notice: 'Ceramic sty elem genre was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ceramic_sty_elem_genre }
      else
        format.html { render action: 'new' }
        format.json { render json: @ceramic_sty_elem_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceramic_sty_elem_genres/1
  # PATCH/PUT /ceramic_sty_elem_genres/1.json
  def update
    respond_to do |format|
      if @ceramic_sty_elem_genre.update(ceramic_sty_elem_genre_params)
        format.html { redirect_to @ceramic_sty_elem_genre, notice: 'Ceramic sty elem genre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ceramic_sty_elem_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_sty_elem_genres/1
  # DELETE /ceramic_sty_elem_genres/1.json
  def destroy
    @ceramic_sty_elem_genre.destroy
    respond_to do |format|
      format.html { redirect_to ceramic_sty_elem_genres_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceramic_sty_elem_genre
      @ceramic_sty_elem_genre = CeramicStyElemGenre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ceramic_sty_elem_genre_params
      params[:ceramic_sty_elem_genre]
    end
end
