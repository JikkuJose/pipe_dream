require 'unirest'
require_relative './constants.rb'

module ShapeShift
  def self.status(address:)
    Unirest.get(URL[:status] + address).body
  end
end
