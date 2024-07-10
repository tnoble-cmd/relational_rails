require 'rails_helper'

#User Story 1

RSpec.describe 'Artists Index Page' do
    
    it 'User can see all artists on the page' do 
        artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
        artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30)

        visit '/artists'
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
        expect(page).to have_content(artist_1.created_at)
        expect(page).to have_content(artist_2.created_at)
    end

    it 'Has a page Header' do 
        visit '/artists'

        expect(page).to have_selector('h1', text: "Artists Page")
    end

    #Artist 3 < Artist 2 < Artist 1 in order on page

    it 'orders Artists is desc order (active record)' do
        artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15, created_at: 10.days.ago)
        artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30, created_at: 5.days.ago)
        artist_3 = Artist.create(name: "Led Zeppelin", is_touring: true, years_active: 20, created_at: 1.day.ago)

        visit '/artists'

        expect(page.body.index(artist_3.name)).to be < page.body.index(artist_2.name)
        expect(page.body.index(artist_2.name)).to be < page.body.index(artist_1.name)
    end
end