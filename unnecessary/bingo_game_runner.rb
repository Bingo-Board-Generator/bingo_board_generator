require './bingo_game'

def start
  new_game = BingoGame.new
  new_game.start_game
end

start
