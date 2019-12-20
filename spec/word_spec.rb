require("rspec")
require("word")

describe '#Word' do

  before(:each) do
    Word.clear()
    Definition.clear()
  end

  describe('(Test 1) #==') do
    it("is the same word if it has the same attributes as another word") do
      word1 = Word.new("Blue", nil)
      word2 = Word.new("Blue", nil)
      expect(word1).to(eq(word2))
    end
  end

  describe("(2) .all") do
    it("returns an empty array when there are no words") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('(Test 3) #save') do
    it("saves an word") do
      word1 = Word.new("Giant Steps", nil)
      word1.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('(Test 4) .clear') do
    it("clears all words") do
      word1 = Word.new("Giant Steps", nil)
      word1.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('(Test 5) .find') do
    it("finds an word by id") do
      word1 = Word.new("Giant Steps", nil)
      word1.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('(Test 6) #update') do
    it("updates an word by id") do
      word1 = Word.new("Giant Steps", nil)
      word1.save()
      word1.update("A Love Supreme")
      expect(word1.name).to(eq("A Love Supreme"))
    end
  end

  describe('(Test 7) #delete') do
    it("deletes an word by id") do
      word1 = Word.new("Giant Steps", nil)
      word1.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      word1.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('(Test 8) .search') do
    it("Searches for matching words by name") do
      word1 = Word.new("Giant Steps", nil)
      word1.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      word3 = Word.new("Green Steps", nil)
      word3.save()

      expect(Word.search("Steps")).to(eq([word1,word3]))
    end
  end

  describe('(Test 9) .sort') do
    it('sorts by alphebetical order') do
    word1 = Word.new("Giant Steps", nil)
    word1.save()
    word2 = Word.new("Blue", nil)
    word2.save()
    word3 = Word.new("Green Steps", nil)
    word3.save()
    expect(Word.sort()).to(eq([word2, word1, word3]))
  end
end

describe('(Test 10) #definitions') do
    it("returns an word's definitions") do
      word1 = Word.new("Giant Steps", nil)
      word1.save()
      definition = Definition.new("Naima", word1.id, nil)
      definition.save()
      definition2 = Definition.new("Cousin Mary", word1.id, nil)
      definition2.save()
      expect(word1.definitions).to(eq([definition, definition2]))
    end
  end

end
