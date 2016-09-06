require 'sinatra'
require 'sinatra/reloader'

random_number = rand(100) + 1

get '/' do
  erb :index, :locals => {:number => random_number}
end