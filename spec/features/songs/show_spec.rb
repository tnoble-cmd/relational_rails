require 'rails_helper'

#User Story 4

RSpec.describe 'Songs show' do

    before (:each) do
        @artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
        @artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30)
    end
    it 'Goes to the correct song with ID' do 
        song_1 = Song.create(name: "Enter Sandman", length: 310, is_single: false, artist_id: @artist_1.id)
        song_2 = Song.create(name: "Thunderstruck", length: 292, is_single: false, artist_id: @artist_2.id)

        visit "/songs/#{song_1.id}"
        expect(page).to have_content(song_1.name)

        visit "/songs/#{song_2.id}"
        expect(page).to have_content(song_2.name)
    end

    it 'Shows the song details correctly' do
        song_1 = Song.create(name: "Enter Sandman", length: 310, is_single: false, artist_id: @artist_1.id)
        song_2 = Song.create(name: "Thunderstruck", length: 292, is_single: false, artist_id: @artist_2.id)

        visit "/songs/#{song_1.id}"
        expect(page).to have_content(song_1.name)
        expect(page).to have_content(song_1.length)
        expect(page).to have_content(song_1.is_single)
        expect(page).to have_content(song_1.artist_id)

        visit "/songs/#{song_2.id}"
        expect(page).to have_content(song_2.name)
        expect(page).to have_content(song_2.length)
        expect(page).to have_content(song_2.is_single)
        expect(page).to have_content(song_2.artist_id)

    end

    it 'Has a header with the song name' do
        song_1 = Song.create(name: "Enter Sandman", length: 310, is_single: false, artist_id: @artist_1.id)
        song_2 = Song.create(name: "Thunderstruck", length: 292, is_single: false, artist_id: @artist_2.id)

        visit "/songs/#{song_1.id}"
        expect(page).to have_selector('h1', text: 'Enter Sandman')

        visit "/songs/#{song_2.id}"
        expect(page).to have_selector('h1', text: 'Thunderstruck')
    end
end