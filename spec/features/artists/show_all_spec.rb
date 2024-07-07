require 'rails_helper'

#User Story 5

RSpec.describe "Parent Children Index (show_all)" do
    before (:each) do
        @artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
        @artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30)

        @song_1 = Song.create(name: "Enter Sandman", length: 310, is_single: false, artist_id: @artist_1.id)
        @song_2 = Song.create(name: "Thunderstruck", length: 292, is_single: false, artist_id: @artist_2.id)
        @song_3 = Song.create(name: "ONE", length: 405, is_single: false, artist_id: @artist_1.id)
        @song_4 = Song.create(name: "Back In Black", length: 260, is_single: false, artist_id: @artist_2.id)
    end

    it 'Displays the correct artist when visiting the page' do
        
        #Metallica
        visit "/artists/#{@artist_1.id}/songs"

        expect(page).to have_content(@artist_1.name)
        expect(page).to_not have_content(@artist_2.name)

        #AC/DC
        visit "/artists/#{@artist_2.id}/songs"

        expect(page).to have_content(@artist_2.name)
        expect(page).to_not have_content(@artist_1.name)
    end

    it 'Displays all children names associated with the parent table' do

        #Metallica
        visit "/artists/#{@artist_1.id}/songs"

        expect(page).to have_content(@song_1.name)
        expect(page).to have_content(@song_3.name)
        expect(page).to_not have_content(@song_2.name)
        expect(page).to_not have_content(@song_4.name)

        #AC/DC
        visit "/artists/#{@artist_2.id}/songs"

        expect(page).to have_content(@song_2.name)
        expect(page).to have_content(@song_4.name)
        expect(page).to_not have_content(@song_1.name)
        expect(page).to_not have_content(@song_3.name)
    end

    it 'Displays all children attributes associated with the parent table' do

        #Metallica
        visit "/artists/#{@artist_1.id}/songs"

        expect(page).to have_content(@song_1.length)
        expect(page).to have_content(@song_1.is_single)
        expect(page).to have_content(@song_1.artist.name)
        expect(page).to have_content(@song_1.created_at)
        expect(page).to have_content(@song_1.updated_at)

        expect(page).to have_content(@song_3.length)
        expect(page).to have_content(@song_3.is_single)
        expect(page).to have_content(@song_3.artist.name)
        expect(page).to have_content(@song_3.created_at)
        expect(page).to have_content(@song_3.updated_at)

        #AC/DC
        visit "/artists/#{@artist_2.id}/songs"

        expect(page).to have_content(@song_2.length)
        expect(page).to have_content(@song_2.is_single)
        expect(page).to have_content(@song_2.artist.name)
        expect(page).to have_content(@song_2.created_at)
        expect(page).to have_content(@song_2.updated_at)

        expect(page).to have_content(@song_4.length)
        expect(page).to have_content(@song_4.is_single)
        expect(page).to have_content(@song_4.artist.name)
        expect(page).to have_content(@song_4.created_at)
        expect(page).to have_content(@song_4.updated_at)
    end
end