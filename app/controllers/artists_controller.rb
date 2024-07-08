class ArtistsController < ApplicationController

    def index
        @artists = Artist.all.order(created_at: :desc)
    end

    def show
        @artists = Artist.find(params[:id])
    end

    def show_all
        @artists = Artist.find(params[:id])
        @songs = @artists.songs
    end

    def new
        
    end

    def create
        @artists = Artist.create(artist_params)

        @artists.save
        
        redirect_to "/artists"
    end

    private
    def artist_params
        params.require(:artist).permit(:name, :is_touring, :years_active)
    end
end