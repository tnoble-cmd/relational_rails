require 'rails_helper'

#User Story 2

RSpec.describe 'Artists show' do 
    it 'Goes to the correct artist with ID' do 
        artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
        artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30)

        visit "/artists/#{artist_1.id}"
        expect(page).to have_content(artist_1.name)
        expect(page).to_not have_content(artist_2.name)

        visit "/artists/#{artist_2.id}"
        expect(page).to have_content(artist_2.name)
        expect(page).to_not have_content(artist_1.name)
    end

    it 'displays the artist details correctly' do
        artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
        artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30)

        visit "/artists/#{artist_1.id}"
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_1.is_touring)
        expect(page).to have_content(artist_1.years_active)

        visit "/artists/#{artist_2.id}"
        expect(page).to have_content(artist_2.name)
        expect(page).to have_content(artist_2.is_touring)
        expect(page).to have_content(artist_2.years_active)
    end

    it 'Has a header with the artist name' do
        artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
        artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30)

        visit "/artists/#{artist_1.id}"
        expect(page).to have_selector('h1', text: 'Metallica')

        visit "/artists/#{artist_2.id}"
        expect(page).to have_selector('h1', text: 'AC/DC')
    end
end