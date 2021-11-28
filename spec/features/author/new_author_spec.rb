require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should have the entry Alan Turing http://wikipedia.de/Alan_Turing in the database" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.de/Alan_Turing'
    find('input[type="submit"]').click
    #get author from database
    #expect(@author.first_name).to eq('Alan')
    #expect(@author.last_name).to eq('Turing')
    #expect(@author.homepage).to eq('http://wikipedia.de/Alan_Turing')
  end

  it "should show an error message if no last name was entered" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.de/Alan_Turing'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
  end

  it "should save the author" do
    # Test for 'New author page should save the author' exercise issue,
    # https://github.com/swt2-intro-exercise/rails-intro-21-hpistudent72/issues/16

    expect(Author.where(last_name: 'Turing').count).to eq(0)

    # When a user visits the new author page
    visit new_author_path    
    # And fills in 'Alan', 'Turing', and 'http://wikipedia.org/Alan_Turing', respectively
    fill_in "author[first_name]", with: 'Alan'
    fill_in "author[last_name]", with: 'Turing'
    fill_in "author[homepage]", with: 'http://wikipedia.org/Alan_Turing'
    # And submits the form
    find('input[type="submit"]').click

    # Then Alan Turing should be found in the database
    alan = Author.find_by!(last_name: 'Turing')
    expect(alan).to_not be_nil

    # Then Alan Turing's first name should be 'Alan'
    expect(alan.first_name).to eq('Alan')
  end
end
