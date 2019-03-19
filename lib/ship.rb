class Ship
attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = @length
    @sunk = false
  end

  def health
    @health
  end

  def sunk?
    if @cruiser.health == 0
    @sunk = true
    @render == "X"
  end
  end

  def hit
    @health -= 1
    @render = "H"
  end


end
