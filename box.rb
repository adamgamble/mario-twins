class Box
  def initialize(window, slot = 0)
    @window = window
    @image = Gosu::Image.new(window, "images/boxCoin.png", false)
    if slot == 0
      @x = 1
    else
      @x = slot * @image.width
    end
    @y = window.height - @image.height - 200
  end

  def draw
    @image.draw(@x,@y,0)
  end

  def update
  end
end
