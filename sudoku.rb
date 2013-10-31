require 'sinatra'
require_relative './lib/sudoku'
require_relative './lib/cell'

enable :sessions # sessions are disabled by default 

def random_sudoku
	seed = (1..9).to_a.shuffle + Array.new(81-9, 0)
	sudoku = Sudoku.new(seed.join)
	sudoku.solve!
	sudoku.to_s.chars
end

def puzzle(sudoku)
	# sudoku_copy = sudoku.dup
	# insert_number_blanks_in sudoku_copy, 40
end

get '/' do
	sudoku = random_sudoku
	session[:solution] = sudoku
  	@current_solution = random_sudoku
	erb :index
end

get '/solution' do 
	@current_solution = session[:solution]
	erb :index
end

get '/last-visit' do
  # get the last visited time from the session
  "Previous visit to homepage: #{session[:last_visit]}"
end









