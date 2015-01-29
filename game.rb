require 'rubygems' # only necessary in Ruby 1.8
require 'gosu'
require_relative 'player.rb'
require_relative 'level.rb'

class MyWindow < Gosu::Window
  def initialize
    super(1440, 900, false)
    @background = Gosu::Image.new(self, "images/bg_castle.png", false)
    @player = Player.new(self)
    @level  = Level.new(self)
    self.caption = 'Game'
  end

  def update
    if button_down? Gosu::KbSpace
      @player.jump
    end

    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.move_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.move_right
    end

    @level.update
    @player.update
  end

  def draw
    @background.draw(0,0,-50)
    @level.draw
    @player.draw
  end
end

window = MyWindow.new
window.show
