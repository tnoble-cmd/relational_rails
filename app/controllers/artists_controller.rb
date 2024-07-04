class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artists = Artist.find(params[:id])
    end
end