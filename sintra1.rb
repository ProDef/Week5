require 'sinatra'

get '/' do
  'This is my homepage.'
end

get '/secret' do
  'This is strictly a need to know bassis.'

end