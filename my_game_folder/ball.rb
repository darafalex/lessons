class Ball
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/Knife.png", true)
    @x = rand(@game_window.width)
    @speed = rand(30)
    @y = 0
  end
  
  def update
    if @y > @game_window.height
      @y = 0
      @x = rand(@game_window.width)
    else
      @y = @y + @speed
    end
  end
  
  def draw
    @icon.draw(@x,@y,20)
  end
  def x
    @x
  end
  
  def reset!
    @y = 0
    @x = rand(@game_window.width)
  end
  
  def y
    @y
  end
  
end
