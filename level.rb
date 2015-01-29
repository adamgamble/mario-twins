require_relative 'grass.rb'
require_relative 'hill.rb'
require_relative 'box.rb'
require_relative 'cloud.rb'
require_relative 'plant.rb'

class Level

  def initialize(window)
    @window = window
    @number_of_tiles = window.width / 65
    @tiles = []
    setup_tiles
  end

  def setup_tiles
    @number_of_tiles.times do |i|
      @tiles << Grass.new(@window, i)
      # Draw hills
      if rand(11) > 9
        @tiles << Hill.new(@window, i)
      end

      # Draw plants
      if rand(11) > 9
        @tiles << Plant.new(@window, i)
      end

      # Draw coin boxes
      if rand(11) > 9
        @tiles << Box.new(@window, i)
      end

      # Draw clouds
      if rand(11) > 8
        @tiles << Cloud.new(@window, i)
      end
    end
  end

  def update
    @tiles.each(&:update)
  end

  def draw
    @tiles.each(&:draw)
  end
end
