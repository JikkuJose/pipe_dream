require 'unirest'

module ShapeShift
  class Shift
    def initialize(from:, to:, withdrawAddress:, returnAddress:)
      @from = from.downcase
      @to = to.downcase
      @withdrawAddress = withdrawAddress
      @returnAddress = returnAddress
    end

    def request
      parameters = {
        withdrawal: "#{ETH_ACCOUNT}",
        pair: "#{@from}_#{@to}",
        returnAddress: "#{BTC_ACCOUNT}"
      }

      headers = {
        "Content-Type" => "application/json"
      }

      response = Unirest.post 'https://shapeshift.io/shift',
        parameters: parameters,
        headers: headers

      response.body
    end
  end
end
