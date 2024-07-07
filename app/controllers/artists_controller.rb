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
end