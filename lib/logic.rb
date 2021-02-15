class Logic
  attr_reader :player_one
  attr_reader :player_two

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def check_draw(board)
    for x in board
      if not x.all?(String)
        return false
      end
    end
    return true
  end

  def check_win(board)
    x1 = board[0]
    x2 = board[1]
    x3 = board[2]
    for x in board
      if x.all?(/X/) or x.all?(/Y/)
        return true
      end
    end
    return true if x1[0] == x2[0] && x2[0] == x3[0]
    return true if x1[1] == x2[1] && x2[1] == x3[1]
    return true if x1[2] == x2[2] && x2[2] == x3[2]
    return true if x1[0] == x2[1] && x2[1] == x3[2]
    return true if x1[2] == x2[1] && x2[1] == x3[0]
  end

  def check_status(board)
    if check_win(board) or check_draw(board)
      return true
    else
      return false
    end
  end

  def numeric?(number)
    Integer(number) != nil rescue false
  end

  def check_if_filled(board, movement)
    i = 1
    for x in board
      for y in x
        if i == movement && !numeric?(y)
          return true
        end

        i += 1
      end
    end
    return false
  end

  def check_move(board, move, player_one_turn)
    movement = player_one
    if !player_one_turn
      movement = player_two
    end
    for x in board
      i = 0
      for y in x
        if y == move.to_i
          x[i] = movement
        end
        i += 1
      end
    end
    if check_status(board)
      return false
    else
      return board
    end
  end

  def player_won(board, move, player_one_turn)
    if move == nil
      return true
    else
      check_move(board, move, player_one_turn)
    end
  end
end
