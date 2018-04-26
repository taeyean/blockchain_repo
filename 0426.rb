require 'sinatra'
require './block'

b = Blockchain.new

get '/' do
  "the number of total blocks : " + b.my_blocks.to_s
end

get '/mine' do
  b.mining.to_s
end