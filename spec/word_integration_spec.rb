require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('.Integration') do

before(:each) do
  Word.clear()
  Definition.clear()
end

describe('(Test 1) create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'test_word')
    click_on('Go!')
    expect(page).to have_content('test_word')
  end
end

describe('(Test 2) create a definition path', {:type => :feature}) do
    it('creates a word and then goes to the word page') do
      word = Word.new("test_word", nil)
      word.save
      visit("/words/#{word.id}")
      fill_in('definition_name', :with => 'test_definition')
      click_on('Add definition')
      expect(page).to have_content('test_definition')
    end
  end

  describe('(Test 3) update a word path', {:type => :feature}) do
    it('updates a word and then goes to the word page') do
      word = Word.new("initial_word", nil)
      word.save
      definition = Definition.new("initial_definition", word.id, nil)
      definition.save

      visit("/words/#{word.id}")
 
      expect(page).to have_content('initial_word' && 'initial_definition')
    end
  end

end