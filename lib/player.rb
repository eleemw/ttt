class Player
  attr_reader :token
  def initialize(token)
    @token = token.upcase
  end

  def move(board)
    puts "Please select a postion 1-9"
    gets.strip
  end
end
