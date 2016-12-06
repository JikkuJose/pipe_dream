require 'json'
require_relative './constants.rb'

module ShapeShift
  def self.coins
    Unirest.get(URL[:coins]).body
  end
end
