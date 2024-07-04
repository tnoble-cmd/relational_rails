require 'rails_helper'

RSpec.describe 'Artists show' do 
    it 'Goes to the correct artist with ID' do 
        artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
        artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30)

        visit "/artists/#{artist_1.id}"
        expect(page).to have_content(artist_1.name)
        expect(page).to_not have_content(artist_2.name)

    end
end