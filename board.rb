class Board
  attr_accessor :squares

  def initialize
    self.squares = *(1..9)
  end

  def display_board
    puts "#{squares[0]} | #{squares[1]} | #{squares[2]}"
    puts "--+---+--"
    puts "#{squares[3]} | #{squares[4]} | #{squares[5]}"
    puts "--+---+--"
    puts "#{squares[6]} | #{squares[7]} | #{squares[8]}"
    puts "\n"
  end
end