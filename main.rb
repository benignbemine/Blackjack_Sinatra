require 'rubygems'
require 'sinatra'
require 'pry'
require_relative 'helpers'
set :sessions, true


get '/' do
  session.clear
  redirect '/set_name'
end

get '/set_name' do
  erb :set_name
end

post '/set_name' do
  if params[:player_name].empty?
    @error = 'Name is required'
    halt erb :set_name
  end
  session[:player_name] = params[:player_name]
  session[:player_wallet] = 500
  redirect '/bet'
end

get '/bet' do
  erb :bet
end

post '/bet' do
  if params[:bet].to_i < 1
    @error = "You must bet at least 1 dollar"
    halt erb :bet
  end

  session[:bet] = params[:bet].to_i
  if okay_bet(session[:bet])
  redirect '/game'
  else
  redirect '/bet'
  end
end

post '/dealer_reveal' do
  session[:dealer_reveal] = params[:dealer_reveal]
  redirect '/game'
end

post '/end_game' do
  redirect '/game_over'
end

post '/game' do
  session[:hit] = params[:button]
  session[:end_game] = params[:end_game]
  redirect '/game'
end

post '/ace' do
  session[:ace] = params[:ace]
  redirect '/game'
end

get '/game' do
  if session[:deck].nil?
    initialize_deck
    erb :game
  else
    player_gameplay
  end
  erb :game
end

get '/game_over' do
  erb :game_over
end

post '/game_over' do
  if params[:replay] == 'Yes'
    reset
    redirect '/bet'
  else
    redirect '/goodbye'
  end
end

get '/goodbye' do
  erb :goodbye
end


