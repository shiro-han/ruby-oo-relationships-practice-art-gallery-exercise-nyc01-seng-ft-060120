class Artist

  attr_reader :name, :years_experience
  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end
  def self.all
    @@all
  end

  def paintings
    Painting.all.select do |paint|
      paint.artist == self
    end
  end

  def galleries
    self.paintings.map do |paint|
      paint.gallery
    end.uniq
  end

  def cities
    self.galleries.map do |g|
      g.city
    end.uniq
  end

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end

  def self.total_experience
    self.all.select do |a|
      a.years_experience
    end.sum.to_i
  end

  def self.most_prolific
    aoh = self.all.map do |a|
      {a => a.paintings.count/a.years_experience}
    end
    aoh.max_by do |hash|
      hash.values[0]
    end.keys[0]
  end

end
