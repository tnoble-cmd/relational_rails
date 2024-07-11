require 'rails_helper'

RSpec.describe "Edit an artist" do
  it 'updates the artist' do
    artist = Artist.create(name: "Pink Floyd", is_touring: true, years_active: 30)

    visit "/artists/#{artist.id}/edit"

    fill_in 'Name', with: 'Dragon Force'
    select 'No', from: 'Is Touring?'
    fill_in 'Years Active:', with: 40

    click_on 'Update Artist'

    expect(page).to have_content('Dragon Force')
    expect(page).to have_content(artist.created_at)
  end
end