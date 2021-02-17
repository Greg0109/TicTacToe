require_relative '../lib/logic.rb'

logic = Logic.new('X', 'O')
test_board_draw = [%w[X O X], %w[O X X], %w[O X O]]
test_board_unfinished = [%w[X O X], ['O', 5, 'X'], ['O', 'X', 9]]
test_board_win = [%w[X O X], %w[O X X], %w[O X X]]
test_board_winingmove = [%w[X O X], %w[O X X], ['O', 'X', 9]]
test_board_drawingmove = [%w[X O X], %w[O X X], ['O', 'X', 9]]

RSpec.describe Logic do
  describe '#check_draw' do
    it 'Returns true if all board is filled' do
      expect(logic.check_draw(test_board_draw)).to eql(true)
    end

    it 'Returns false if all board is not filled' do
      expect(logic.check_draw(test_board_unfinished)).to eql(false)
    end
  end

  describe '#check_win' do
    it 'Returns nil if theres not a win combination' do
      expect(logic.check_win(test_board_draw)).to eql(nil)
    end

    it 'Returns true if theres a win combination' do
      expect(logic.check_win(test_board_win)).to eql(true)
    end
  end

  describe '#check_status' do
    it 'Returns true as the array entered is a draw' do
      expect(logic.check_status(test_board_draw)).to eql(true)
    end

    it 'Returns true as the array entered is a win' do
      expect(logic.check_status(test_board_win)).to eql(true)
    end

    it 'Returns false as the array entered is unfinished' do
      expect(logic.check_status(test_board_unfinished)).to eql(false)
    end
  end

  describe '#numeric?' do
    it 'Returns true if the entered number is an integer' do
      expect(logic.numeric?(1)).to eql(true)
    end

    it 'Returns false for anything that is not an Integer' do
      expect(logic.numeric?('Hello World')).to eql(false)
    end
  end

  describe 'check_if_filled' do
    it 'Returns true if the position is filled' do
      expect(logic.check_if_filled(test_board_unfinished, 1)).to eql(true)
    end
    it 'Returns false if the position is not filled' do
      expect(logic.check_if_filled(test_board_unfinished, 5)).to eql(false)
    end
  end

  describe 'check_move' do
    it 'Returns false and the board if the move is not a ending move' do
      expect(logic.check_move(test_board_unfinished, 5, true)).to eql([false, [%w[X O X], %w[O X X], ['O', 'X', 9]]])
    end

    it 'Returns true and the board if the move is a ending move' do
      expect(logic.check_move(test_board_winingmove, 9, true)).to eql([true, [%w[X O X], %w[O X X], %w[O X X]]])
    end

    it 'Returns true and the board if the move is a drawing move' do
      expect(logic.check_move(test_board_drawingmove, '9', false)).to eql([true, [%w[X O X], %w[O X X], %w[O X O]]])
    end
  end

  describe 'player_won' do
    it 'Outputs true if move is nil' do
      expect(logic.player_won(test_board_winingmove, nil, true)).to eql(true)
    end

    it 'Returns the same as check_move is the move is not nil' do
      expect(logic.player_won(test_board_winingmove, 9, true)).to eql([true, [%w[X O X], %w[O X X], %w[O X X]]])
    end
  end
end
