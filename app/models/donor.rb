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

    def donations
        Donation.all.select do |dona|
            dona.donor == self
        end
    end

    def artist_names
        artArray = self.donations.map do |dona|
            dona.artist
        end.uniq
        artArray.map do |a|
            a.name
        end
    end
end