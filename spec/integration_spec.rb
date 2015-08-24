require('capybara/rspec')
require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application

describe('/divisions', {type: :feature}) do
  it("displays all divisions") do
    Division.create({name: "Party"})
    visit("/")
    click_link("HR Manager")
    expect(page).to have_content("Divisions of Ryan's Fun Company")
  end

  it('adds divisions to page') do
    visit('/divisions')
    fill_in("name", :with => "COOL")
    click_button('Add Division')
    expect(page).to have_content("COOL")
  end

  it('updates a division') do
    division = Division.create({name: "Celebration"})
    visit('/divisions')
    click_link("edit")
    fill_in("name", :with => "COOL")
    click_button('Submit Changes')
    expect(page).to have_content("COOL")
  end
end
