require "spec_helper"

describe 'The survey design path', {type: :feature} do
  it "does not allow blank titles" do
    visit('/design/surveys')
    fill_in('title', with: '')
    click_button('Add Survey')
    expect(page).to have_content("Title can't be blank")
  end

  it "allows user to add and edit surveys" do
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

  it "allows user to create and edit questions for a survey" do
    visit('/design/surveys')
    fill_in('title', with: 'Best Pizza Places')
    click_button('Add Survey')
    fill_in('number', with: '1')
    fill_in('question-text', with: "What is your favorite kind of Pizza?")
    click_button('Add Question')
    expect(page).to have_content('What is your favorite kind of Pizza?')
    click_link('Edit or Remove')
    fill_in('question-text', with: "What is your favorite style of Pizza?")
    click_button('Update Question')
    expect(page).to have_content("What is your favorite style of Pizza?")
    expect(page).to have_no_content("What is your favorite kind of Pizza?")
  end

  it "allows user to delete questions" do
    visit('/design/surveys')
    fill_in('title', with: 'Best Pizza Places')
    click_button('Add Survey')
    fill_in('number', with: '1')
    fill_in('question-text', with: "What is your favorite kind of Pizza?")
    click_button('Add Question')
    click_link('Edit or Remove')
    click_button('Delete Question')
    expect(page).to have_no_content('What is your favorite kind of Pizza?')
  end
end
