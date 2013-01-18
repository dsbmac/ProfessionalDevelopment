$reference = ['R','P','S']

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    game.each do |x|
    	raise NoSuchStrategyError unless "RPS".include? x[1].upcase 
    end
    score = ($reference.index(game[0][1]) - $reference.index(game[1][1])) % $reference.length
    
    case score
		when 0     	
			winner = game[0]
		when 1
			winner = game[0]
		when 2
			winner = game[1]
	end

	return winner
end

def rps_tournament_winner(tournament)
  players = tournament.flatten(2)
  
  while players.length > 1
    players.insert(0, rps_game_winner( [players.pop, players.pop]) ) 
  end
  return players[0]

end