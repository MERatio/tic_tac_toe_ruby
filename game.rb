require './player.rb'
require './board.rb'

class Game
  attr_accessor :board, :current_player, :round, :winner, :draw

  def initialize
    @player1 = Player.new('Player 1', "X")
    @player2 = Player.new('Player 2', "O")
    self.board = Board.new
    self.round = 1
    play
  end
 
  private

  def play
    while !@winner & !@draw
      board.display_board
      @current_player = get_current_player
      square = get_player_square
      input_square(square)
      check_draw
      check_winner
      @round += 1
    end
    display_game_result
  end

  def get_current_player
    @round % 2 == 0 ? @player2 : @player1
  end

  def get_player_square
    square = nil
    unless @board.squares.include?(square)
      puts "#{@current_player.name} (#{current_player.option}) type in 1 to 9"
      square = gets.chomp.to_i
      puts "\n"
    end
    square
  end

  def input_square(square)
    @board.squares[square - 1] = @current_player.option
  end

  def check_winner
    lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    lines.each do |line| 
      a, b, c = line
      if @board.squares[a] && @board.squares[a] == @board.squares[b] && @board.squares[a] == @board.squares[c]
        @winner = get_current_player
      end
    end
    return nil
  end

  def check_draw
    round == 9 ? @draw = true : @draw = false 
  end

  def display_game_result
    board.display_board
    if @winner
      puts "#{@winner.name} (#{@winner.option}) wins the game!"
    elsif @draw
      puts "Draw!"
    end
  end
end