require 'json'

module Electrum
  class History
    def self.valid_transaction
      lambda { |tx| tx["date"] == "----" }
    end

    def self.list
      JSON::parse `electrum history`
    end

    def self.confirmed
      list.reject { |tx| tx["date"] == "----" }
    end

    def self.unconfirmed
      list.select { |tx| tx["date"] == "----" }
    end

    def self.all
      list
    end
  end
end
