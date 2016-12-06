require_relative './constants.rb'
require 'unirest'

module ShapeShift
  class EmailReceipt
    def initialize(email:, transaction_id:)
      @email = email
      @transaction_id = transaction_id
    end

    def post
      parameters = {
        email: @email,
        txid: @transaction_id
      }

      headers = {
        "Content-Type" => "application/json"
      }

      begin
        response = Unirest.post URL[:email_receipt],
          parameters: parameters,
          headers: headers
      rescue Exception => e
        puts e.message
        exit
      end

      response.body
    end

    def reply
      post
    end
  end
end
