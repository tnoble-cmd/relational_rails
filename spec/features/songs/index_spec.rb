require 'rails_helper'

#User Story 3

RSpec.describe 'Songs Index Page' do
    
    before (:each) do
        @artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
        @artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30)
    end
    it 'User can see all artists on the page' do 
        

        song_1 = Song.create(name: "Enter Sandman", length: 310, is_single: false, artist_id: @artist_1.id)
        song_2 = Song.create(name: "Thunderstruck", length: 292, is_single: false, artist_id: @artist_2.id)

        visit '/songs'
        expect(page).to have_content(song_1.name)
        expect(page).to have_content(song_2.name)
    end

    it 'Has a page Header' do 
        visit '/songs'

        expect(page).to have_selector('h1', text: "All Songs")
    end

end