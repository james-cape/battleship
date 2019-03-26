class Cell
  attr_reader :coordinate, :empty, :ship, :fired_upon, :reveal

  def initialize(coordinate, reveal = ".")
    @coordinate = coordinate
    @ship       = nil
    @fired_upon = false
    @reveal     = reveal
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship == nil
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if !empty?
      ship.hit
    end
  end

  def render(reveal = false)
    if reveal == true && !empty? && !fired_upon?
      "S"
    elsif fired_upon? && empty?
      "M"
    elsif fired_upon? && @ship.sunk?
      "X"
    elsif fired_upon?
      "H"
    else
      "."
    end
  end
end
