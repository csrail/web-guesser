require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  player_guess = params["guess"].to_i
  response = check_guess(player_guess)
  @@guesses_remaining -= 1
  evaluate_guesses(player_guess)
  
  
      erb :index, :locals => {:answer               => @@random_number,
                              :player_guess         => params["guess"],
                              :response             => response,
                              :color_response       => @color_response,
                              :guesses_remaining    => @@guesses_remaining,
                              :message              => @message}
end

@@random_number = rand(100) + 1
@@guesses_remaining = 10

def evaluate_guesses(player_guess)
  if player_guess == @@random_number
    reset_game
    @message = "You won!! -- A new number has been generated and your guesses remaining reset."
  end
  
  if @@guesses_remaining == 0
    reset_game
    @message = "You lost!! -- A new number has been generated and your guesses remaining reset."
  end
end

def reset_game
  @@guesses_remaining = 9
  @@random_number = rand(100) + 1
end



def check_guess(player_guess)
  if player_guess == "".to_i
    ""
  elsif player_guess == @@random_number
    @color_response = "response__paragraph--correct"
    "The secret number was #{@@random_number}"
  elsif player_guess < @@random_number
    if player_guess < @@random_number - 5
      @color_response = "response__paragraph--far"
      "Much too low"
    else
      @color_response = "response__paragraph--near"
      "Too low"
    end
  elsif player_guess > @@random_number
    if player_guess > @@random_number + 5
      @color_response = "response__paragraph--far"
      "Much too high"
    else
      @color_response = "response__paragraph--near"
      "Too high"
    end
  end
end