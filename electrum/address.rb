require 'json'

module Electrum
  class Address
    def self.list(funded: false)
      JSON::parse `electrum listaddresses #{funded ? '--funded' : ''}`
    end
  end
end
