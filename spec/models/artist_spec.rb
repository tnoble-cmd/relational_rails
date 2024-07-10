require 'rails_helper'

RSpec.describe Artist, type: :model do

  it 'can be created' do
    artist = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
    expect(artist).to be_valid
  end

  it 'has relationship with songs' do
    artist = Artist.create(name: "Metallica", is_touring: true, years_active: 15)
    song = Song.create(name: "Enter Sandman", length: 310, is_single: false, artist_id: artist.id)

    expect(artist.songs).to eq([song])
  end

  it 'can be ordered by created_at' do
    artist_1 = Artist.create(name: "Metallica", is_touring: true, years_active: 15, created_at: 10.days.ago)
    artist_2 = Artist.create(name: "AC/DC", is_touring: false, years_active: 30, created_at: 5.days.ago)
    artist_3 = Artist.create(name: "Led Zeppelin", is_touring: true, years_active: 20, created_at: 1.day.ago)

    expect(Artist.recently_created).to eq([artist_3, artist_2, artist_1])
  end
end