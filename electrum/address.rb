require 'json'

module Electrum
  class Address
    def self.list(arguments: "")
      JSON::parse `electrum listaddresses #{arguments}`
    end

    def self.funded
      list(arguments: '--funded')
    end

    def self.unfunded
      list - funded
    end

    def self.all
      list
    end
  end
end
