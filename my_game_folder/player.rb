class Player
  
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/player2.png", true)
    reset!
  end
  
  def reset!
    @x = 975
    @y = 1950
  end
  
  def draw
    @icon.draw(@x,@y,10)
  end
  
  def move_left
    if @x < 0
      @x = 0
    else
      @x = @x - rand(30)
    end
  end
  
  def move_right
    if @x > (@game_window.width - 75)
      @x = @game_window.width - 75
    else
      @x = @x + rand(30)
    end
  end
  
  def move_up
    if @y < 0
      @y = 0
    else
      @y = @y - rand(30)
    end
  end
  
  def move_down
    if @y > (@game_window.height-75)
      @y = @game_window.height - 75
    else
      @y = @y + rand(30)
    end
  end
  def hit_by?(balls)
    balls.any? { |ball| Gosu::distance(@x,@y,ball.x, ball.y) < 50}
  end   
  
end 