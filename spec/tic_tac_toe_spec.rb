# frozen_string_literal: true

require_relative '../lib/tic_tac_toe/game.rb'

# rubocop:disable Metrics/BlockLength
describe Game do
  subject { Game.new }

  describe '#check_winner' do
    it 'handles top horizontal line' do
      subject.board.squares = ['X', 'X', 'X',
                               4, '0', 6,
                               '0', 8, 9]
      subject.send(:check_winner)
      expect(subject.winner.name).to eql('Player 1')
    end

    it 'handles middle horizontal line' do
      subject.board.squares = ['X', 2, 'X',
                               'O', 'O', 'O',
                               7, 8, 'X']
      subject.send(:check_winner)
      expect(subject.winner.name).to eql('Player 2')
    end

    it 'handles bottom horizontal line' do
      subject.board.squares = ['0', 2, 3,
                               4, '0', 6,
                               'X', 'X', 'X']
      subject.send(:check_winner)
      expect(subject.winner.name).to eql('Player 1')
    end

    it 'handles left vertical line' do
      subject.board.squares = ['O', 'X', 'X',
                               'O', 5, 6,
                               'O', 8, 'X']
      subject.send(:check_winner)
      expect(subject.winner.name).to eql('Player 2')
    end

    it 'handles middle vertical line' do
      subject.board.squares = [1, 'X', 3,
                               4, 'X', 6,
                               7, 'X', 9]
      subject.send(:check_winner)
      expect(subject.winner.name).to eql('Player 1')
    end

    it 'handles right vertical line' do
      subject.board.squares = ['X', 'X', 'O',
                               4, 'X', 'O',
                               7, 8, 'O']
      subject.send(:check_winner)
      expect(subject.winner.name).to eql('Player 2')
    end

    it 'handles right diagonal line' do
      subject.board.squares = ['X', 2, 'O',
                               4, 'X', 'O',
                               7, 3, 'X']
      subject.send(:check_winner)
      expect(subject.winner.name).to eql('Player 1')
    end

    it 'handles left diagonal line' do
      subject.board.squares = ['X', 'X', 'O',
                               4, 'O', 'X',
                               'O', 3, 9]
      subject.send(:check_winner)
      expect(subject.winner.name).to eql('Player 2')
    end
  end

  describe '#check_draw' do
    it 'handles draw when all squares are taken' do
      subject.round = 1
      subject.send(:check_draw)
      expect(subject.draw).to eql(false)
    end

    it 'handles draw when the round reached 9' do
      subject.round = 9
      subject.send(:check_draw)
      expect(subject.draw).to eql(true)
    end
  end
end
# rubocop:enable Metrics/BlockLength
