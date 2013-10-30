require 'sinatra'

get '/hp' do
  'This is my homepage.'
end

get '/secret' do
  'This is strictly a need to know bassis.'
end

get '/' do 
	@name = %w(Daffy James Oscar Wiking).sample
	erb :index
end

get '/hello' do 
	@visitor = params[:name]
	erb :index
end

get '/berry' do
  erb :berry
end