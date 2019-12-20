class Word
    attr_reader :name, :id
  
    @@words = {}
    @@id_tally = 0

    def initialize(name, id)
        @name = name
        @id = id || @@id_tally += 1
    end

    def ==(other_word)
        self.name.eql?(other_word.name)
    end

    def self.clear
        @@words = {}
        @@total_rows = 0
    end

    def self.all
        @@words.values()
    end

    def self.find(id)
        @@words[id]
    end
    
    def save
        @@words[self.id] = Word.new(self.name, self.id)
    end

end