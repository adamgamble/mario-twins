class Hill
  def initialize(window, slot = 0)
    @window = window
    if rand(2) == 1
      @image = Gosu::Image.new(window, "images/hill_large.png", false)
    else
      @image = Gosu::Image.new(window, "images/hill_smallAlt.png", false)
    end
    if slot == 0
      @x = 1
    else
      @x = slot * @image.width
    end
    @y = window.height - @image.height - rand(20..69)
  end

  def draw
    @image.draw(@x,@y,-1)
  end

  def update
  end
end
