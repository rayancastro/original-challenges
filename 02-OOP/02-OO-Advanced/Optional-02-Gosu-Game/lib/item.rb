require 'gosu'

module ZOrder
  BACKGROUND, STARS, PLAYER, UI = *0..3
end

class Star
  attr_reader :x, :y

  def initialize
    @image = Gosu::Image.new("./media/apple.png")
    @color = Gosu::Color::RED.dup
    # @color.red = rand(256 - 40) + 40
    # @color.green = rand(256 - 40) + 40
    # @color.blue = rand(256 - 40) + 40
    @x = rand * 640
    @y = rand * 480
  end

  def draw
    img = @image
    img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
        ZOrder::STARS, 1, 1, @color, :add)
  end
end
