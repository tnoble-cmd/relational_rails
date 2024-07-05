class SongsController < ApplicationController 

    def index
        @songs = Song.all
    end

    def show
        @songs = Song.find(params[:id])
    end

end