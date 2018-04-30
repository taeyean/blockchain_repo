require 'digest'
require 'securerandom'

class Blockchain

  def initialize
  
    @chain = ['block1',]
	@transaction = []
	@wallet = {}
  end
  
  def mkWallet
    #if @wallet == {}
	  newWallet_addr = SecureRandom.uuid
	  @wallet[newWallet_addr] = 1000
	#else
	#  @wallet
	#end
  end

  def trans(s, r, a)
    if @wallet[s].nil?
	  "[snd] This wallet did not exist"
	elsif @wallet[r].nil?
	  "[rcv] This wallet did not exist"
    elsif @wallet[s] < a.to_f
	  "[snd] Not Enought Amount"
	else  
	  transaction = {
  	    "sender" => s,
	    "receiver" => r,
	    "amount" => a
	  }
	  @wallet[r] = @wallet[r] + a.to_f
	  @wallet[s] = @wallet[s] - a.to_f
	  @transaction << transaction
	  "Done"
	end
  end
  
  def show_allWallet
    @wallet
  end
  
  def mining
	begin
	  nonce = rand(100)
	end while nonce != 0
	
	block = {
	  "nonce" => nonce,
	  "index" => @chain.length + 1,
	  "previous_block" => Digest::SHA256.hexdigest(last_block.to_s),
	  "time" => Time.now,
	  "transaction" => @transaction
	}
	@chain << block
	@transaction = []
  end
  
  def current_chain
    @chain
  end
  
  def last_block
    @chain[-1]
  end
end