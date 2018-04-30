require 'sinatra'
require './block'

b = Blockchain.new

get '/' do
  message = ""
  b.current_chain.each do |c|
    message << "the index value is " + c['index'].to_s + "<br>"
	message << "the nonce value is " + c['nonce'].to_s + "<br>"
	message << "the time is " + c['time'].to_s + "<br>"
	message << "last address is " + c['previous_block'].to_s + "<br>"
	message << "my address is " + Digest::SHA256.hexdigest(c.to_s) + "<br>"
	message << "transaction " + c['transaction'].to_s + "<br>"
	message << "<hr>"
  end
  
  message
end

get '/mine' do
  b.mining.to_s
  "I found blocks"
end
 
get '/transaction' do
  "sender: "+params["sender"]+"<br>receiver: "+params["receiver"]+"<br>amount: "+params["amount"]
  b.trans(params["sender"], params["receiver"], params["amount"])
  #"Done"
end

get '/mkWallet' do
  b.mkWallet.to_s
end

get '/allWallet' do
  b.show_allWallet.to_s
end