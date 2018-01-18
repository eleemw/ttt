class Board
  attr_accessor :cells

  def initialize
    @cells = Board.create
  end

  def reset!
    self.cells = Board.create
  end

  def position(pos)
    cells[pos.to_i - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    cells.count { |cell| cell != " " }
  end

  def taken?(pos)
    position(pos) != " "
  end

  def valid_move?(pos)
    if pos.match(/\D/) then return false end
    !taken?(pos)
  end

  def update(pos, player)
    if !taken?(pos)
      cells[pos.to_i - 1] = player.token
    end
  end

  def display
    puts [
      " #{cells[0]} | #{cells[1]} | #{cells[2]} ",
      "-----------",
      " #{cells[3]} | #{cells[4]} | #{cells[5]} ",
      "-----------",
      " #{cells[6]} | #{cells[7]} | #{cells[8]} ",
    ].join("")
  end

  def self.create
    Array.new(9, " ")
  end
end
