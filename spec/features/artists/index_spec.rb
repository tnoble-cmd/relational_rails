require 'rails_helper'

RSpec.describe 'Artists Index Page' do
    
    it 'User can see all artists on the page' do 
        artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
        artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30)

        visit '/artists'
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
    end

    it 'Has a page Header' do 
        visit '/artists'

        expect(page).to have_selector('h1', text: "Artists Page")
    end

end