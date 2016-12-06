require 'json'

module Electrum
  def self.balance
    JSON::parse `electrum getbalance`
  end
end
