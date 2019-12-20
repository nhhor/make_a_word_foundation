require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'test_word')
    click_on('Go!')
    expect(page).to have_content('test_word')
  end
end

describe('create a definition path', {:type => :feature}) do
    it('creates an word and then goes to the word page') do
      word = Word.new("test_word", nil)
      word.save
      visit("/words/#{word.id}")
      fill_in('definition_name', :with => 'test_definition')
      click_on('Add definition')
      expect(page).to have_content('test_definition')
    end
  end