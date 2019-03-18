class Ship
attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = 3
    @sunk = false
    @hit = hit
  end

  def health
  end

  def sunk?
  end

  def hit
  end

end
