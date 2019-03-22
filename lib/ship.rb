class Ship
attr_reader :name, :length, :sunk, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  def sunk?
    if @health <= 0
      @sunk = true
      @sunk
    else
      @sunk = false
      @sunk
    end
  end

  def hit
    @health -= 1
  end

end
