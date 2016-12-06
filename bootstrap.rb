require_relative './electrum.rb'
require_relative './shape_shift.rb'
require 'json'
require 'awesome_print'
require 'logger'
require 'dotenv'

Dotenv.load

logger = Logger.new('development.log')
