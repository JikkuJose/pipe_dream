require 'json'

module Electrum
  class History
    def self.valid_transaction
      lambda { |tx| tx["timestamp"] != false }
    end

    def self.list
      JSON::parse `electrum history`
    end

    def self.confirmed
     list.select(&valid_transaction)
    end

    def self.unconfirmed
      list.reject(&valid_transaction)
    end

    def self.all
      list
    end
  end
end
