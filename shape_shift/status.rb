require 'unirest'

module ShapeShift
  URL = 'https://shapeshift.io/txStat/'

  def self.status(address:)
    Unirest.get(URL + address).body
  end
end
