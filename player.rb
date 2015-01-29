class Player
  SPEED = 3
  BOOST = 2
  JUMP_SPEED = 6
  MAX_JUMP_HEIGHT = 100
  def initialize(window)
    @jump_velocity = 0
    @jumping = false
    @window = window
    @front_image = Gosu::Image.new(window, "images/p1_stand.png", false)
    @back_image = Gosu::Image.new(window, "images/p1_stand_flipped.png", false)
    @image = @front_image
    @x = 0
    @y = window.height - @image.height - 70
    @base_height = @y
    @walk_image = 1
    @going = :right
  end

  def draw
    @image.draw(@x,@y,0)
  end

  def jump
    if @jumping == false
      @jump_velocity = 0
      @jumping = true
      @jump_heading = :up
    end
  end

  def move_left
    @going = :left
    if @x - speed >= 0
      @x -= speed
    end
  end
  
  def move_right
    @going = :right
    @image = @front_image
    if @x + speed + @image.width <= @window.width
      @x += speed
    end
  end

  def update
    # Jump logic
    if @jumping == true
      if @jump_heading == :up
        @y -= JUMP_SPEED
        if @y <= @base_height - MAX_JUMP_HEIGHT
          @jump_heading = :down
        end
      else
        @y += JUMP_SPEED
        if @y >= @base_height
          @y = @base_height
          @jumping = false
        end
      end
    end

    if @window.button_down? Gosu::KbRight
      get_new_walk_image
    elsif @window.button_down? Gosu::KbLeft
      get_new_walk_image(true)
    else
      set_standing_image
    end
  end

  def set_standing_image
    if @going == :right
      @image = @front_image
    else
      @image = @back_image
    end
  end

  def get_new_walk_image(flipped = false)
    @image = Gosu::Image.new(@window, "images/p1_walk#{@walk_image}#{flipped ? "_flipped" : ""}.png", false)
    @walk_image += 1
    if @walk_image > 11
      @walk_image = 1
    end
  end

  def speed
    if @window.button_down? Gosu::KbLeftShift
      SPEED + BOOST
    else
      SPEED
    end
  end
end
