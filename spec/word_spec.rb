require('rspec')
require('word.rb')

describe '#Word' do

    before(:each) do
        Word.clear()
    end

    describe("(1) #==") do
        it("is the same word if it has the same attributes as another word") do
          word1 = Word.new("Test 1", nil)
          word2 = Word.new("Test 1", nil)
          expect(word1).to(eq(word2))
        end
      end
  
      describe("(2) #save") do
        it("saves a word") do
          word1 = Word.new("Test 3", nil) # nil added as second argument
          word1.save()
          word2 = Word.new("Test 3", nil) # nil added as second argument
          word2.save()
          expect(Word.all).to(eq([word1, word2]))
        end
      end

      describe("(3) .all") do
        it("returns an empty array when there are no words") do
          expect(Word.all()).to(eq([]))
        end
      end
          
      describe("(4) .clear") do
        it("clears all words") do
          word1 = Word.new("Test 4", nil)
          word1.save()
          word2 = Word.new("Test 4", nil)
          word2.save()
          Word.clear()
          expect(Word.all).to(eq([]))
        end
      end

      
  end