class Logic
  attr_reader :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def check_draw(board)
    board.each do |x|
      return false unless x.all?(String)
    end
    true
  end

  def check_win(board)
    x1 = board[0]
    x2 = board[1]
    x3 = board[2]
    board.each do |x|
      return true if x.all?(/X/) or x.all?(/Y/)
    end
    return true if x1[0] == x2[0] && x2[0] == x3[0]
    return true if x1[1] == x2[1] && x2[1] == x3[1]
    return true if x1[2] == x2[2] && x2[2] == x3[2]
    return true if x1[0] == x2[1] && x2[1] == x3[2]
    return true if x1[2] == x2[1] && x2[1] == x3[0]
  end

  def check_status(board)
    if check_win(board) or check_draw(board)
      true
    else
      false
    end
  end

  def numeric?(number)
    !Integer(number).nil?
  rescue StandardError
    false
  end

  def check_if_filled(board, movement)
    i = 1
    board.each do |x|
      x.each do |y|
        return true if i == movement && !numeric?(y)

        i += 1
      end
    end
    false
  end

  def check_move(board, move, player_one_turn)
    movement = player_one
    movement = player_two unless player_one_turn
    board.each do |x|
      i = 0
      x.each do |y|
        x[i] = movement if y == move.to_i
        i += 1
      end
    end
    [check_status(board), board]
  end

  def player_won(board, move, player_one_turn)
    if move.nil?
      true
    else
      check_move(board, move, player_one_turn)
    end
  end
end
