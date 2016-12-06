require 'json'
require_relative './constants.rb'

module ShapeShift
  class DepositLimit
    def initialize(from:, to:)
      @from = from
      @to = to
      @pair = "#{from}_#{to}".downcase
    end

    def response
      Unirest.get(URL[:deposit_limit] + @pair).body
    end

    def to_hash
      {
        minimum: response["min"],
        maximum: response["limit"]
      }
    end
  end
end
