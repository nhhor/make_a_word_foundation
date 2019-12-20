require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Giant Steps", nil)
    @word.save()
  end

  describe('(Test 1) #==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("Naima", @word.id, nil)
      definition2 = Definition.new("Naima", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('(Test 2) .all') do
    it("returns a list of all definitions") do
      definition = Definition.new("Giant Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('(Test 3) .clear') do
    it("clears all definitions") do
      definition = Definition.new("Giant Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('(Test 4) #save') do
    it("saves a definition") do
      definition = Definition.new("Naima", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('(Test 5) .find') do
    it("finds a definition by id") do
      definition = Definition.new("Giant Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('(Test 6) #update') do
    it("updates an definition by id") do
      definition = Definition.new("Naima", @word.id, nil)
      definition.save()
      definition.update("Mr. P.C.", @word.id)
      expect(definition.name).to(eq("Mr. P.C."))
    end
  end

  describe('(Test 7) #delete') do
    it("deletes an definition by id") do
      definition = Definition.new("Giant Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('(Test 8) .find_by_word') do
    it("finds definitions for an word") do
      word2 = Word.new("Blue", nil)
      word2.save
      definition = Definition.new("text1", @word.id, nil)
      definition.save()
      definition2 = Definition.new("text2", word2.id , nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

end