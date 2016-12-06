require 'json'
require_relative './constants.rb'

module ShapeShift
  class Deposit
    def initialize(from: nil, to: nil, address: nil)
      @from = from
      @to = to
      @pair = "#{from}_#{to}".downcase
      @address = address
    end

    def response
      Unirest.get(URL[:deposit_limit] + @pair).body
    end

    def limit
      {
        minimum: response["min"],
        maximum: response["limit"]
      }
    end

    def status
      Unirest.get(URL[:deposit_status] + @address).body
    end
  end
end
