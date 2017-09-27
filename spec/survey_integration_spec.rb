require "spec_helper"

describe 'The survey design path', {type: :feature} do
  it "allows user to add a survey" do
    visit('/design/surveys')
    fill_in('title', with: 'Favorite Programming Languages')
    click_button('Add Survey')
    expect(page).to have_content('Favorite Programming Languages')
  end

  it "does not allow blank titles" do
    visit('/design/surveys')
    fill_in('title', with: '')
    click_button('Add Survey')
    expect(page).to have_content("Title can't be blank")
  end

  it "allows user to edit surveys" do
    visit('/design/surveys')
    fill_in('title', with: 'Favorite Programming Languages')
    click_button('Add Survey')
    click_link('Edit')
    fill_in('title', with: 'Favourite Programming Languages')
    click_button('Update Survey')
    expect(page).to have_content('Favourite Programming Languages')
    expect(page).to have_no_content('Favorite Programming Languages')
  end

  it "allows user to delete surveys" do
    visit('/design/surveys')
    fill_in('title', with: 'Best Pizza Places')
    click_button('Add Survey')
    click_link('Edit')
    click_button('Delete Survey')
    expect(page).to have_no_content('Best Pizza Places')
  end
end
