class Ball
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/ball.png", true)
    @x = rand(@game_window.width)
    @speed = rand(13)
    @y = 0
  end
  
  def update
    
    @y = @y + @speed
    #@x = @x + @speed
    
  end
  
  def draw
    @icon.draw(@x,@y,20)
  end

  def x
    @x
  end
  
  def reset!

  end
  
  def y
    @y
  end
  
end
