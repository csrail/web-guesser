require 'sinatra'
require 'sinatra/reloader'

get '/' do
  player_guess = params["guess"].to_i
  response = check_guess(player_guess)
  
  erb :index, :locals => {:answer               => RANDOM_NUMBER, 
                          :player_guess         => params["guess"],
                          :response             => response}
end

RANDOM_NUMBER = rand(100) + 1


def check_guess(player_guess)
  if player_guess == "".to_i
    ""
  elsif player_guess == RANDOM_NUMBER
    "Response: The secret number was #{RANDOM_NUMBER}"
  elsif player_guess < RANDOM_NUMBER
    if player_guess < RANDOM_NUMBER - 5
      "Response: Much too low"
    else
      "Response: Too low"
    end
  elsif player_guess > RANDOM_NUMBER
    if player_guess > RANDOM_NUMBER + 5
      "Response: Much too high"
    else
      "Response: Too high"
    end
  end
end