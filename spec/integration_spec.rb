require('capybara/rspec')
require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application

describe('/', {type: :feature}) do
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
end
