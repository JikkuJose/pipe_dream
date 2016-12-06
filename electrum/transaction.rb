require 'json'

module Electrum
  class Transaction
    def initialize(to:, amount:, password:)
      @to = to
      @amount = amount
      @password = password
    end

    def signed_transaction
      @signed_transaction ||= `electrum payto #{@to} #{@amount} --password #{@password}`
    end

    def broadcast(tx = nil)
      JSON::parse `echo '#{tx || signed_transaction}' | electrum broadcast -`
    end

    def send
      broadcast
    end
  end
end
