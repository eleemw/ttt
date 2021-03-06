class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("x"),
                 player_2=Players::Human.new("o"),
                 board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    (board.cells.count { |cell| cell != " " } % 2) ? player_1 : player_2
  end

  def over?
    board.cells.all? { |cell| cell != " " }
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if board.cells[combo[0]] == player_1.token &&
          board.cells[combo[1]] == player_1.token &&
          board.cells[combo[2]] == player_1.token ||
          board.cells[combo[0]] == player_2.token &&
          board.cells[combo[1]] == player_2.token &&
          board.cells[combo[2]] == player_2.token
        return combo
      end
    end
  end

  def draw?
    over? && !won?
  end

  def winner
    if (won?)
      board.cells[won?.first]
    else
      nil
    end
  end
end
