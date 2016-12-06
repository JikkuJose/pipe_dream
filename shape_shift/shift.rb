require 'unirest'

module ShapeShift
  class Shift
    def initialize(from:, to:, withdraw_address:, return_address:)
      @from = from.downcase
      @to = to.downcase
      @withdraw_address = withdraw_address
      @return_address = return_address
    end

    def request
      parameters = {
        withdrawal: "#{@withdraw_address}",
        pair: "#{@from}_#{@to}",
        returnAddress: "#{@return_address}"
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
