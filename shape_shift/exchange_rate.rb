require 'json'
require_relative './constants.rb'

module ShapeShift
  class ExchangeRate
    def initialize(from:, to:)
      @from = from
      @to = to
      @pair = "#{from}_#{to}".downcase
    end

    def response
      Unirest.get(URL[:exchange_rate] + @pair).body
    end

    def to_hash
      {
        rate: response["rate"]
      }
    end
  end
end
