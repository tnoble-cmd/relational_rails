require 'rails_helper'

RSpec.describe 'Songs show' do
    it 'Goes to the correct song with ID' do 
        song_1 = Song.create(name: "Enter Sandman", length: 310, is_single: false, artists_id: 1)
        song_2 = Song.create(name: "Thunderstruck", length: 292, is_single: false, artists_id: 2)

        visit "/songs/#{song_1.id}"
        expect(page).to have_content(song_1.name)

        visit "/songs/#{song_2.id}"
        expect(page).to have_content(song_2.name)
    end

    it 'Shows the song details correctly' do
        song_1 = Song.create(name: "Enter Sandman", length: 310, is_single: false, artists_id: 1)
        song_2 = Song.create(name: "Thunderstruck", length: 292, is_single: false, artists_id: 2)

        visit "/songs/#{song_1.id}"
        expect(page).to have_content(song_1.name)
        expect(page).to have_content(song_1.length)
        expect(page).to have_content(song_1.is_single)
        expect(page).to have_content(song_1.artists_id)

        visit "/songs/#{song_2.id}"
        expect(page).to have_content(song_2.name)
        expect(page).to have_content(song_2.length)
        expect(page).to have_content(song_2.is_single)
        expect(page).to have_content(song_2.artists_id)

    end

    it 'Has a header with the song name' do
        song_1 = Song.create(name: "Enter Sandman", length: 310, is_single: false, artists_id: 1)
        song_2 = Song.create(name: "Thunderstruck", length: 292, is_single: false, artists_id: 2)

        visit "/songs/#{song_1.id}"
        expect(page).to have_selector('h1', text: 'Enter Sandman')

        visit "/songs/#{song_2.id}"
        expect(page).to have_selector('h1', text: 'Thunderstruck')
    end
end