class Word
    attr_reader :id, :name

    @@words = {}
    @@word_tally = 0

    def initialize(name, id)
        @name = name
        @id = id || @@word_tally += 1
    end

    def self.all
        @@words.values()
    end

    def self.search(x)
        @@words.values().select {|e| /#{x}/i.match? e.name}
    end

    def save
        @@words[self.id] = Word.new(self.name, self.id)
    end

    def ==(word_to_compare)
        self.name() == word_to_compare.name()
    end

    def self.clear
        @@words = {}
        @@word_tally = 0
    end

    def self.find(id)
        @@words[id]
    end

    def update(name)
        @name = (name != '') ? name : @name
    end

    def delete
        @@words.delete(self.id)
    end

    def self.sort()
        @@words.values().sort { |a, b| a.name <=> b.name }
    end

    def definitions
        Definition.find_by_word(self.id)
    end
    
end