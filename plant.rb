class Plant
  def initialize(window, slot = 0)
    @window = window
    case rand(1..2)
    when 1
      @image = Gosu::Image.new(window, "images/plant.png", false)
    when 2
      @image = Gosu::Image.new(window, "images/plantPurple.png", false)
    end
    if slot == 0
      @x = 1
    else
      @x = slot * @image.width
    end
    @y = window.height - @image.height - 71
  end

  def draw
    @image.draw(@x,@y,0)
  end

  def update
  end
end
