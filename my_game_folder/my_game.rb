require 'rubygems'
require 'gosu'
require 'player'
require 'ball'

class MyGame < Gosu::Window
  def initialize
    super(2000, 2000, false)
    @player1 = Player.new(self)
    @balls = 50.times.map {Ball.new(self)}
    @running = true
    @font = Gosu::Font.new(self, Gosu::default_font_name, 60)
    
    @background = Gosu::Image.new(self, "images/background.png", true )
    @score = 0
  end
  
  def update
    if @running
      @score = @score + 1
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end
    
      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end
    
      if button_down? Gosu::Button::KbUp
        @player1.move_up
      end
    
      if button_down? Gosu::Button::KbDown
        @player1.move_down
      end
    
      @balls.each { |ball| ball.update }
    
    
      if @player1.hit_by? @balls
        boom!
      end
      
    else
      if button_down? Gosu::Button::KbEscape
        restart_game
      end
    end
  end
  
  def restart_game
    @score = 0
    @running = true
    @balls.each { |ball| ball.reset! }
    @player1.reset!
  end
  def boom!
    @running = false
  end
  
  def draw
    @font.draw("The score is: #{@score}", 20,20,5)
    @background.draw(0,0,1)
    @player1.draw
    @balls.each { |ball| ball.draw }
  end
  
end

game = MyGame.new
game.show
