def Donation
    @@all = []
    attr_reader :artist, :donor
    def initialize(artist, donor)
        @artist = artist
        @donor = donor
        @@all << self
    end
    def self.all
        @@all
    end
end