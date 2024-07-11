class ArtistsController < ApplicationController

    def index
        # @artists = Artist.all.order(created_at: :desc)
        @artists = Artist.recently_created
    end

    def show
        @artists = Artist.find(params[:id])
    end

    def show_all
        @artists = Artist.find(params[:id])
        @songs = @artists.songs
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
          redirect_to artists_path, notice: 'Artist was successfully created.'
        else
          render :new
        end
    end

    def edit
        @artist = Artist.find(params[:id])
    end
    
    def update
        @artist = Artist.find(params[:id])
        if @artist.update(artist_params)
          redirect_to @artist, notice: 'Artist was successfully updated.'
        else
          render :edit
        end
    end

    private
    def artist_params
        params.require(:artist).permit(:name, :is_touring, :years_active)
    end
end