class Donor

    @@all = []
    attr_reader :name, :ammount
    
    def initialize(name, ammount)
        @name = name
        @ammount = ammount
        @@all << self
    end
    def self.all
        @@all
    end

    def artist_names
        artArray = Artist.all.select do |a|
            a.donor == self
        end.uniq
        artArray.map do |a|
            a.name
        end
    end
end