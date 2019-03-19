class Ship
attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = 3
    @sunk = false
  end

  def health
    @health
  end

  def sunk?
    if @cruiser.health == 0
    @sunk = true
  end
  end

  def hit
    @health -= 1
  end

end
