require 'rails_helper'

RSpec.describe "New Artist Form" do
  
    it "renders the new artist form" do
        visit "/artists"

        click_on "New Artist"

        expect(page).to have_current_path("/artists/new")
        
        expect(page).to have_selector("form")
        expect(page).to have_field("Artist Name:")
        expect(page).to have_select("Is Touring?")
        expect(page).to have_field("Years Active:")
        expect(page).to have_button("Create Artist")
    end
    
    it "creates a new artist" do
    visit "/artists/new"

    fill_in "Name", with: "The Beatles"
    select "Yes", from: "Is Touring?"
    fill_in "Years Active:", with: 10
    click_on "Create Artist"

    #after clicking submit, should be redirected to /artists
    expect(page).to have_current_path("/artists")
    expect(page).to have_content("The Beatles")
  end
end