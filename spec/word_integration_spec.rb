require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('.Integration') do

before(:each) do
  Word.clear()
  Definition.clear()
end

describe('(Test 1) Create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'test_word')
    click_on('Go!')
    expect(page).to have_content('test_word')
  end
end

describe('(Test 2) Create a definition path', {:type => :feature}) do
    it('creates a word and then goes to the word page') do
      word = Word.new("test_word", nil)
      word.save
      visit("/words/#{word.id}")
      fill_in('definition_name', :with => 'test_definition')
      click_on('Add definition')
      expect(page).to have_content('test_definition')
    end
  end

  describe('(Test 3) Update a definition path', {:type => :feature}) do
    it('updates a definition and then goes to the word page') do
      word = Word.new("initial_word", nil)
      word.save
      definition = Definition.new("initial_definition", word.id, nil)
      definition.save
      visit("/words/#{word.id}")
      click_on('initial_definition')
      fill_in('name', :with => 'updated_definition')
      click_on('Update definition')
      expect(page).to have_content('initial_word' && 'updated_definition')
    end
  end

  describe('(Test 4) Delete a definition path', {:type => :feature}) do
    it('Deletes a word and then goes to the word page') do
      word = Word.new("initial_word", nil)
      word.save
      definition = Definition.new("initial_definition", word.id, nil)
      definition.save
      visit("/words/#{word.id}")
      click_on('initial_definition')
      click_on('Delete definition')
      expect(page).not_to have_content('updated_definition')
    end
  end

  describe('(Test 5) Update a word path', {:type => :feature}) do
    it('updates a word and then goes to the word page') do
      word = Word.new("initial_word", nil)
      word.save
      definition = Definition.new("initial_word", word.id, nil)
      definition.save
      visit("/words/#{word.id}")
      click_on('Edit word')
      fill_in('name', :with => 'updated_word')
      click_on('Update')
      expect(page).to have_content('updated_word')
    end
  end

end