require 'gosu'
require_relative 'player.rb'
require_relative 'item.rb'

class GameWindow < Gosu::Window
  def initialize
    @player = Player.new

    super 640, 480, :fullscreen => false
    self.caption = "Rayan's Snake Game"
    @background_image = Gosu::Image.new("./media/dirt.jpg", :tileable => true)


    @player.warp(320, 240)
    @stars = Array.new
    @font = Gosu::Font.new(20)
  end

  def update
    @player.die?

    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
      @player.turn_up
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
      @player.turn_down
    end

    @player.move
    @player.collect_stars(@stars)

    if rand(100) < 4 and @stars.size < 10
      @stars.push(Star.new)
    end
  end

  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND)
    @player.draw
    @stars.each { |star| star.draw }
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
    # @font.draw("X: #{@player.x} Y: #{@player.y}", 30, 30, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)

    if @player.isdead
      @font.draw("YOU LOSE. Score: #{@player.score}", 320, 240, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
    end
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

GameWindow.new.show
