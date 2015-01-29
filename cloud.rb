class Cloud
  def initialize(window, slot = 0)
    @window = window
    case rand(1..3)
    when 1
      @image = Gosu::Image.new(window, "images/cloud1.png", false)
    when 2
      @image = Gosu::Image.new(window, "images/cloud2.png", false)
    when 3
      @image = Gosu::Image.new(window, "images/cloud3.png", false)
    end
    if slot == 0
      @x = 1
    else
      @x = slot * @image.width
    end
    set_random_height
    set_random_speed
  end

  def draw
    @image.draw(@x,@y,0)
  end

  def update
    @x -= @speed

    if @x < 0 - @image.width
      @x = @window.width + 200
      set_random_height
    end
  end

  def set_random_height
    @y = @window.height - @image.height - rand(300..700)
  end

  def set_random_speed
    @speed = rand(1..2)
  end
end
