class Settings
  def get_players(player_one)
    if player_one == 'X'
      'O'
    else
      'X'
    end
  end

  def make_board
    first_line = [1, 2, 3]
    second_line = [4, 5, 6]
    third_line = [7, 8, 9]
    [first_line, second_line, third_line]
  end
end
