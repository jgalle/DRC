class CeramicGenresController < ApplicationController
  # GET /ceramic_genres
  # GET /ceramic_genres.json
  def index
    @ceramic_genres = CeramicGenre.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramic_genres }
    end
  end

  # GET /ceramic_genres/1
  # GET /ceramic_genres/1.json
  def show
    @ceramic_genre = CeramicGenre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic_genre }
    end
  end

  # GET /ceramic_genres/new
  # GET /ceramic_genres/new.json
  def new
    @ceramic_genre = CeramicGenre.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ceramic_genre }
    end
  end

  # GET /ceramic_genres/1/edit
  def edit
    @ceramic_genre = CeramicGenre.find(params[:id])
  end

  # POST /ceramic_genres
  # POST /ceramic_genres.json
  def create
    @ceramic_genre = CeramicGenre.new(params[:ceramic_genre])

    respond_to do |format|
      if @ceramic_genre.save
        format.html { redirect_to @ceramic_genre, notice: 'Ceramic genre was successfully created.' }
        format.json { render json: @ceramic_genre, status: :created, location: @ceramic_genre }
      else
        format.html { render action: "new" }
        format.json { render json: @ceramic_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ceramic_genres/1
  # PUT /ceramic_genres/1.json
  def update
    @ceramic_genre = CeramicGenre.find(params[:id])

    respond_to do |format|
      if @ceramic_genre.update_attributes(params[:ceramic_genre])
        format.html { redirect_to @ceramic_genre, notice: 'Ceramic genre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceramic_genres/1
  # DELETE /ceramic_genres/1.json
  def destroy
    @ceramic_genre = CeramicGenre.find(params[:id])
    @ceramic_genre.destroy

    respond_to do |format|
      format.html { redirect_to ceramic_genres_url }
      format.json { head :no_content }
    end
  end
end
