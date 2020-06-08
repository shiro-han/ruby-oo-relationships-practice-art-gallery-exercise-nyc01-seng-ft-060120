class Gallery

  attr_reader :name, :city
  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end
  def self.all
    @@all
  end

  def paintings
    Painting.all.select do |paint|
      paint.gallery == self
    end
  end

  def artists
    self.paintings.map do |paint|
      paint.artist
    end
  end

  def artist_names
    self.artists.map do |a|
      a.name
    end
  end

  def most_expensive_painting
    aoh = self.paintings.map do |paint|
      {paint => paint.price}
    end
    aoh.max_by {|hash| hash.values[0]}.keys[0]
  end

end
