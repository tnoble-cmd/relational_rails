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
        @artists = Artist.new({name: params[:artist][:name], is_touring: params[:artist][:is_touring], years_active: params[:artist][:years_active]})

        @artists.save
        
        redirect_to "/artists"
    end
end